import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:life_at_iitk/app/posts/student/student_cubit.dart';
import 'package:life_at_iitk/domain/models/hive/council.dart';
import 'package:life_at_iitk/domain/models/hive/people.dart';
import 'package:life_at_iitk/domain/models/student.dart';
import 'package:life_at_iitk/domain/notfs/notifs_model.dart';
import 'package:life_at_iitk/hive_extension.dart';
import 'package:life_at_iitk/infrastructure/database/hive_class.dart';
import 'package:life_at_iitk/infrastructure/core/extensions.dart';

import '../../../domain/core/failures.dart';
import '../../../domain/database/database_failure.dart';
import '../../../domain/database/database_interface.dart';
import '../../../domain/models/hive/user.dart';
import '../../../domain/models/posts.dart';

part 'repo_bloc.freezed.dart';
part 'repo_event.dart';
part 'repo_state.dart';

@injectable
class RepoBloc extends Bloc<RepoEvent, RepoState> {
	final DBInterface _dbInterface;
	final StudentCubit cubit;
  RepoBloc(this._dbInterface, this.cubit) : super(RepoState.initial());
	final Notfs _schema = Notfs();
	 StreamSubscription<Either<Failure, List<Post>>> ? _postStreamSubscription;

  @override
  Stream<RepoState> mapEventToState(
    RepoEvent event,
  ) async* {
		yield* event.map(
			loadAppData: (e) async* {
				yield state.copyWith(
					isLoading: true,
					showError: false,
					isAppLoading: true,
					appData: none(),
					dbFailureOrSuccess: none()
				);
				try {
					final value = await Future.wait([
						loadData<User>(),
						loadData<People>(),
						loadData<Council>(),
					], eagerError: true);
					final councilBox = Hive.getBox<Council>();
					final councilData = councilBox.getCouncil;
					final List<String> level2 = [];
					councilData.subCouncil.forEach((key, value) {
						level2.addAll(value.level2);
					});
					final userData = Hive.getBox<User>();
					userData.put(0, userData.getUser.copyWith(
						isLevel3: councilData.level3.contains(userData.getUser.id),
						isLevel2: level2.contains(userData.getUser.id),
					));
					final peopleData = Hive.getBox<People>().get(0, 
							defaultValue: People(id: userData.getUser.id,));
					// print(peopleData.toMap());
					// print(userData.getUser.toMap());
					final Map<String, SubCouncil> _subCouncil = {};
					councilData.subCouncil.forEach((councilName,subCouncil) {
						_subCouncil.putOrUpdate(
							councilName,
							() => subCouncil.copyWith(
							coordiOfInCouncil: (peopleData?.councils[councilName])?? []
              // []
              //   :peopleData.councils[councilName]
							) 
						);
					});
					// print(councilData.copyWith(
					// 	coordOfCouncil: peopleData.councils.keys.toList(),	
					// 	subCouncil: _subCouncil
					// ).toMap());
					councilBox.putAt(0, councilData.copyWith(
						coordOfCouncil: peopleData?.councils.keys.toList()??[],	
						subCouncil: _subCouncil
					));
					// final res = await _dbInterface.getUserStudentData(queryColumn: _schema.username, queryData: userData.getUser.id);
					// value.add(res);
					await cubit.getUserStudentData();
					yield state.copyWith(
						isLoading: false,
						showError: false,
						isAppLoading: false,
						appData: some([]),
						dbFailureOrSuccess: some(right(value),
						)
					);
				}on Failure catch (e) {
					yield state.copyWith(
						isLoading: false,
						showError: true,
						isAppLoading: false,
						dbFailureOrSuccess: some(left(e))
					);
				}on DBFailure catch(e){
					log('$e Error while loading app');
					yield state.copyWith(
						isLoading: false,
						showError: true,
						isAppLoading: false,
						dbFailureOrSuccess: some(left(Failure.dbFailure(e)))
					);
				}
			},
			loadPeopleData: (e) async* {
				yield state.copyWith(
					isLoading: true,
					showError: false,
					dbFailureOrSuccess: none()
				);
				try{
					final value = await loadData<People>();
					yield state.copyWith(
						isLoading: false,
						showError: false,
						dbFailureOrSuccess: some(right(value))
					);
				}on Failure catch (e) {
					yield state.copyWith(
						isLoading: false,
						showError: true,
						dbFailureOrSuccess: some(left(e))
					);
				}
			},
			loadUserData: (e) async* {
				yield state.copyWith(
					isLoading: true,
					showError: false,
					dbFailureOrSuccess: none()
				);
				try{
					final value = await loadData<User>();
					yield state.copyWith(
						isLoading: false,
						showError: false,
						dbFailureOrSuccess: some(right(value))
					);
				}on Failure catch (e) {
					yield state.copyWith(
						isLoading: false,
						showError: true,
						dbFailureOrSuccess: some(left(e))
					);
				}
			},
			loadCouncilData: (e) async* {
				yield state.copyWith(
					isLoading: true,
					showError: false,
					dbFailureOrSuccess: none()
				);
				try{
					final value = await loadData<Council>();
					yield state.copyWith(
						isLoading: false,
						showError: false,
						dbFailureOrSuccess: some(right(value))
					);
				}on Failure catch (e) {
					yield state.copyWith(
						isLoading: false,
						showError: true,
						dbFailureOrSuccess: some(left(e))
					);
				}
			},
			getAllStudentData: (e) async*{

			},
			getUserStudentData: (e) async* {
				// await _dbInterface.getUserD;
			}, 
			updateStudentData: (e) async*{ 
				yield state.copyWith(
					isLoading :true,
					showError: false,
					dbFailureOrSuccess: none()
				);
				final possibleFail = await _dbInterface.updateStudentData(
					queryColumn: e.queryColumn,
					queryData: e.queryColumn,
					rollno: e.rollno
				);
				yield possibleFail.fold(
					(l) => state.copyWith(
						isLoading: false,
						showError: true,
						dbFailureOrSuccess: some(left(Failure.dbFailure(l)))
					),
					(r) => state.copyWith(
						isLoading: false,
						showError: false,
						dbFailureOrSuccess: some(right(r)))
					);
			}
		);
  }
	@override
  Future<void> close() async {
		await _postStreamSubscription?.cancel();
    return super.close();
  }

	Future<T> loadData<T>() async{
		final box = Hive.box<T>(hiveDBNameUsingClass[T] ?? "user");
		if(T == People){
			return box.get(0,defaultValue: const People(id: "") as T) ?? const People(id: "") as T;
		}
		if(box.isEmpty)	{
			throw const Failure.dbFailure(DBFailure.dataNotExists());
		}
		return box.getAt(0) ?? const People(id: "") as T;
	}

	// Stream<RepoState> _performActionOnPostNotfs(
	// 	Either<Failure, List<Post>> failureOrNotes
	// )async*{
	// 			// yield failureOrNotes.fold(
  //       //   (f) => RepoState.loadFailure(f),
  //       //   (notes) => RepoState.loadSuccess(notes),
  //       // );
	// }
}


