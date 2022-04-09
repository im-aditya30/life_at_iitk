import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:life_at_iitk/domain/api/api_failure.dart';
import 'package:life_at_iitk/domain/api/api_interface.dart';
import 'package:life_at_iitk/domain/database/database_failure.dart';
import 'package:life_at_iitk/domain/database/database_interface.dart';
import 'package:life_at_iitk/domain/models/basic_schema.dart';
import 'package:life_at_iitk/domain/models/hive/user.dart';
import 'package:life_at_iitk/domain/models/student.dart';
import 'package:life_at_iitk/hive_extension.dart';
import 'package:life_at_iitk/presentation/screen/profile/profile_pic.dart';
part 'student_state.dart';
part 'student_cubit.freezed.dart';

@injectable
class StudentCubit extends Cubit<StudentState> {
	final DBInterface dbInterface;
	final ApiInterface apiInterface;
  StudentCubit(this.dbInterface, this.apiInterface) : super(StudentState.initial());
	final emptyStudentArray = List<Student>.empty(); 
	final BasicSchema schema = BasicSchema();
	Future<void> getAllStudentData() async {
		emit(state.copyWith(
			isLoading: true,
			allStudentData: emptyStudentArray
		));
		final res = await dbInterface.getAllStudentData();
		res.fold(
			(l) => emit(state.copyWith(
				isLoading: false,
				dbFailure: some(l)
			)),
			(r) => emit(state.copyWith(
				isLoading: false,
				allStudentData: r,
			))
		);
	}

	Future<void> updateStudentDB() async{
		emit(StudentState.updatingDB());
		final res = await apiInterface.fetchAllStudentsData();
		res.fold(
			(f) => emit(StudentState.updatingDB().copyWith(
				isUpdating: false,
				apiFailure: some(f)
			)),
			(r) => emit(StudentState.updatingDB().copyWith(
				isUpdating: false,
			)));
		
	}

	Future<void> updateStudentData(Student student,
		MapEntry<String, String> value) async {
		emit(StudentState.initial().copyWith(
			isUpdating: true,
		));
		final update = await apiInterface.updateStudentData(
			rollNo: student.rollNo,
			value: value);
			
		update.fold(
			(l) => emit(StudentState.initial().copyWith(
				isUpdating: false,
				apiFailure: some(l)
			)),
			(r) async{
				final res = await dbInterface.updateStudentData(
					queryColumn: value.key,
					queryData: value.value,
					rollno: student.rollNo
				);
		return res.fold(
			(l) => emit(StudentState.initial().copyWith(
				isUpdating: false,
				dbFailure: some(l)
			)),
			(r) => emit(StudentState.initial().copyWith(
				isUpdating: false,
				profileData: r,
				userSData: r,
			)));
			});
		
	}

	Future<void> getUserStudentData() async{
		final userBox = Hive.getBox<User>();
		emit(state.copyWith(
			isLoading: true,
		));
		final res = await dbInterface.getUserStudentData(queryColumn: schema.username, queryData: userBox.getUser.id!);
		// print(res);
		res.fold(
			(l) => emit(state.copyWith(
				isLoading: false,
				dbFailure: some(l)
			)),
			(r) async{
				await userBox.put(0, userBox.getUser.copyWith(name: r.name,rollno: r.rollNo,gender: r.gender));
				emit(state.copyWith(
					isLoading: false,
					profileData: r,
					userSData: r,
				));
			});
	}

	Future<void> loadUserProfile(String id) async{
		emit(StudentState.loadingProfilePic().copyWith(
			isProfilePicLoading: true,
		));
		// await Future.delayed(const Duration(seconds: 2));
		final res = await dbInterface.getUserStudentData(queryColumn: schema.username, queryData: id);
		// final res = await ProfilePic(student).getProfilePic();
		res.fold(
			(l) => emit( StudentState.loadingProfilePic().copyWith(
				isProfilePicLoading: false,
				dbFailure: some(l),
			)),
			(r) async{
				final val = await UserProfilePic(r).getUserProfilePic();
				val.fold(
					(l) => emit(StudentState.loadingProfilePic().copyWith(
							isProfilePicLoading: false,
							// dbFailure: some(const DBFailure.unknownError()),
							apiFailure: some(l)
						)), 
					(i) => emit(StudentState.loadingProfilePic().copyWith(
						isProfilePicLoading: false,
						profileData: r,
						userSData: r,
					)));
			}
		);
	}
}
