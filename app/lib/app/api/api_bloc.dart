import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:life_at_iitk/app/posts/student/student_cubit.dart';
import 'package:life_at_iitk/domain/api/api_failure.dart';
import 'package:life_at_iitk/domain/database/posts/post_db_interface.dart';
import 'package:life_at_iitk/injection.dart';
import 'package:life_at_iitk/presentation/screen/misc/preferences.dart';

import '../../domain/api/api_interface.dart';
import '../../domain/database/database_interface.dart';
import '../../domain/models/posts.dart';

part 'api_bloc.freezed.dart';
part 'api_event.dart';
part 'api_state.dart';

@injectable
class ApiBloc extends Bloc<ApiEvent, ApiState> {
  final DBInterface _dbInterface;
  final ApiInterface _apiInterface;
  final PostDBInterface _postDBInterface;

  ApiBloc(this._dbInterface, this._apiInterface, this._postDBInterface)
      : super(ApiState.initial());

  @override
  Stream<ApiState> mapEventToState(
    ApiEvent event,
  ) async* {
    yield* event.map(
      fetchAppData: (e) async* {
        yield ApiState.initial()
            .copyWith(load: state.load.union({API.fetchAppData}));
        try {
          final values = await Future.wait([
            _apiInterface
                .fetchCouncilData()
                .then((value) => value.leftMap((l) => throw l)),
            _apiInterface
                .fetchUserData()
                .then((value) => value.leftMap((l) => throw l)),
            _apiInterface
                .fetchAllStudentsData()
                .then((value) => value.leftMap((l) => throw l)),
            _apiInterface
                .fetchAllPost(timeStamp: 0)
                .then((value) => value.leftMap((l) => throw l)),
          ]);
          log(values.toString(), name: 'Api Bloc FecthAppData');
          if (values[1].getOrElse(() => false) == true) {
            await _apiInterface
                .fetchPeopleData()
                .then((value) => value.leftMap((l) => throw l));
          }
					if(((values[2] as Either<ApiFailure, Response>)
								.getOrElse(() => Response('', 404))).body.isNotEmpty){
									await getIt<StudentCubit>().getUserStudentData();
									// _dbInterface.getUserStudentData(queryColumn: , queryData: queryData)
					}
          yield state.copyWith(
              load: state.load.difference({API.fetchAppData}),
              apiFailureOrSuccessOption: some(right(unit)));
        } on ApiFailure catch (e) {
          yield state.copyWith(
              load: state.load.difference({API.fetchAppData}),
              apiFailureOrSuccessOption: some(left(e)));
        }
      },
      fetchCouncilData: (e) async* {
        yield ApiState.initial().copyWith(
            load: state.load.union({API.fetchCoucil}));
        final failureOrSuccess = await _apiInterface.fetchCouncilData();
        yield state.copyWith(
            load: state.load.difference({API.fetchCoucil}),
            apiFailureOrSuccessOption: some(failureOrSuccess));
      },
      fetchUserData: (e) async* {
        yield ApiState.initial().copyWith(
            load: state.load.union({API.fetchUser}),);
        final failureOrSuccess = await _apiInterface.fetchUserData();
        yield state.copyWith(
            load: state.load.difference({API.fetchUser}),
            apiFailureOrSuccessOption: some(
                failureOrSuccess.fold((l) => left(l), (r) => right(unit))));
      },
      fetchPeopleData: (e) async* {
        yield ApiState.initial().copyWith(
            load: state.load.union({API.fetchPeople}),);
        final failureOrSuccess = await _apiInterface.fetchPeopleData();
        yield state.copyWith(
            load: state.load.difference({API.fetchPeople}),
            apiFailureOrSuccessOption: some(failureOrSuccess));
      },
      makeCoordinator: (e) async* {
        yield ApiState.initial().copyWith(
            load: state.load.union({API.makeCoordinator}));
        final failureOrSuccess = await _apiInterface.makeCoordinator(
          council: e.council,
          id: e.id,
          sub: e.sub,
        );
        yield state.copyWith(
            load: state.load.difference({API.makeCoordinator}),
            apiFailureOrSuccessOption: some(failureOrSuccess));
      },
      updatePreferences: (e) async* {
        yield ApiState.initial().copyWith(
            load: state.load.union({API.prefs}));
        final failureOrSuccess =
            await _apiInterface.updatePreferences(council: e.prefs.upCouncil);
        yield state.copyWith(
            load: state.load.difference({API.prefs}),
						value: some(e.prefs),
            apiFailureOrSuccessOption: some(failureOrSuccess));
      },
      publishPost: (e) async* {
        yield ApiState.initial().copyWith(
            load: state.load.union({API.publishPost}));
        final failureOrSuccess =
            await _apiInterface.publishPost(postUid: e.postUid);
        yield state.copyWith(
            load: state.load.difference({API.publishPost}),
            apiFailureOrSuccessOption: some(failureOrSuccess));
      },
      requestPostApproval: (e) async* {
        yield ApiState.initial().copyWith(
            load: state.load.union({API.requestApproval}), apiFailureOrSuccessOption: none());
        final failureOrSuccess =
            await _apiInterface.requestPostApproval(post: e.post);
        yield state.copyWith(
            load: state.load.difference({API.requestApproval}),
            apiFailureOrSuccessOption: some(failureOrSuccess));
      },
      updatePost: (e) async* {
        yield ApiState.initial().copyWith(
            load: state.load.union({API.updatePost}),
						 apiFailureOrSuccessOption: none());
        final failureOrSuccess = await _apiInterface.updatePost(post: e.post);
        yield state.copyWith(
            load: state.load.difference({API.updatePost}),
            apiFailureOrSuccessOption: some(failureOrSuccess));
      },
      makeDraft: (e) async* {
        yield ApiState.initial().copyWith(
            load: state.load.union({API.makeDraft}));
        final failureOrSuccess = await _apiInterface.makeDraft(post: e.post);
        yield state.copyWith(
            load: state.load.difference({API.makeDraft}),
            apiFailureOrSuccessOption: some(failureOrSuccess));
      },
      publishDraft: (e) async* {
        yield ApiState.initial().copyWith(
            load: state.load.union({API.publishDraft}));
        final failureOrSuccess =
            await _apiInterface.publishDraft(postId: e.postUid);
        yield state.copyWith(
            load: state.load.difference({API.publishDraft}),
            apiFailureOrSuccessOption: some(failureOrSuccess));
      },
      updateSUserData: (e) async* {},
      fetchSUserData: (e) async* {},
      fetchAllPost: (e) async* {
        yield ApiState.initial().copyWith(
            load: state.load.union({API.fetchAllPost}));
        final lastTime = e.timeStamp == 0 ? right(0) :  await _dbInterface.getLastTime();
				log("Fetch All Post ${e.timeStamp}", name: 'API BLOC');
        final failureOrSuccess = await _apiInterface.fetchAllPost(
            timeStamp: lastTime.getOrElse(() => 0));
        yield state.copyWith(
            load: state.load.difference({API.fetchAllPost}),
						value: some('waiting'),
            apiFailureOrSuccessOption: some(
                failureOrSuccess.fold<Either<ApiFailure, Unit>>(
                    (l) => left(const ApiFailure.unknownError()),
                    (r) {
											_dbInterface.saveLastTime();
											return right(unit);
										})));
      },
      fetchPostWithId: (e) async* {},
      fetchPostWithTypeCouncil: (e) async* {},
      fetchAllStudentsData: (e) async* {
        yield ApiState.initial().copyWith(
            load: state.load.union({API.fetchAllStudent}));
        final failureOrSuccess = await _apiInterface.fetchAllStudentsData();
        yield state.copyWith(
            load: state.load.difference({API.fetchAllStudent}),
            apiFailureOrSuccessOption: some(
                failureOrSuccess.fold<Either<ApiFailure, Unit>>(
                    (l) => left(const ApiFailure.unknownError()),
                    (r) => right(unit))));
      },
      updateStudentData: (e) async* {},
      deletePost: (e) async* {
				yield ApiState.initial().copyWith(
            load: state.load.union({API.deltPost}));
        final failureOrSuccess = await _apiInterface.deletePost(
					post: e.post
				);
        yield state.copyWith(
            load: state.load.difference({API.deltPost}),
            apiFailureOrSuccessOption: some(
                failureOrSuccess.fold<Either<ApiFailure, Unit>>(
                    (l) => left(const ApiFailure.unknownError()),
                    (r) => right(unit))));
			},
    );
  }
}
