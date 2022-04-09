part of 'student_cubit.dart';

@freezed
abstract class StudentState with _$StudentState {
  // const factory StudentState.initial() = _Initial;
	// const factory StudentState.loading() = _Loading;
	// const factory StudentState.loaded(List<Student> data) = _Loaded;
	// const factory StudentState.updatingDB() = _UpdatingDB;
	// const factory StudentState.updatedDB(List<Student> data) = _UpdatedDB;
	// const factory StudentState.updatedFailure(ApiFailure f) = _UpdatedFailure;
	// const factory StudentState.loadingStudentData() = _LoadingStudentData;
	// const factory StudentState.loadedStudentData(Student data) = _LoadedStudentData;
	// const factory StudentState.loadFailureStudentData(DBFailure f, Student data) = _LoadFailureStudentData;
	// const factory StudentState.loadingProfile() = _LoadingProfile;
	// const factory StudentState.loadedProfile(Student data) = _LoadedProfile;
	// const factory StudentState.loadFailure(DBFailure f,List<Student> data) = _LoadFailure;
	const factory StudentState({
		required bool isLoading,
		required bool isUpdating,
		required bool isProfilePicLoading,
		required List<Student> allStudentData,
		required Student userSData,
		required Student profileData,
		required Option<ApiFailure>? apiFailure,
		required Option<DBFailure>? dbFailure,
	}) = _StudentConstructor;

	factory StudentState.initial() => StudentState(
		isLoading: false, 
		isUpdating: false, 
		isProfilePicLoading: false,
		allStudentData: List.empty(), 
		userSData: Student.defaultData(''), 
		profileData: Student.defaultData(''), 
		apiFailure: none(), dbFailure: none());

	factory StudentState.loadingSData() => StudentState(
		isLoading: true, 
		isUpdating: false, 
		isProfilePicLoading: false,
		allStudentData: List.empty(), 
		userSData: Student.defaultData(''), 
		profileData: Student.defaultData(''), 
		apiFailure: null, dbFailure: null);
	factory StudentState.loadingProfilePic() => StudentState(
		isLoading: false, 
		isUpdating: false, 
		isProfilePicLoading: true,
		allStudentData: List.empty(), 
		userSData: Student.defaultData(''), 
		profileData: Student.defaultData(''), 
		apiFailure: null, dbFailure: null);
	
	factory StudentState.updatingDB() => StudentState(
		isLoading: false, 
		isUpdating: true, 
		isProfilePicLoading: false,
		allStudentData: List.empty(), 
		userSData: Student.defaultData(''), 
		profileData: Student.defaultData(''), 
		apiFailure: null, dbFailure: null);
}
