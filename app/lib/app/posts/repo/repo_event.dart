part of 'repo_bloc.dart';

@freezed
abstract class RepoEvent with _$RepoEvent {
  // const factory RepoEvent.getAllPostWithoutPermission({
	// 	required String type,
	// 	int isFeatured
	// }) = _GetAllPostWithoutPermission;
  // const factory RepoEvent.getPostWithId({
	// 	required String postId,
	// }) = _GetPostWithId;
  // const factory RepoEvent.updatePostWithId({
	// 	required String postId,
	// 	required String queryColumn,
	// 	required String queryData,
	// }) = _UpdatePostWithId;
	const factory RepoEvent.updateStudentData({
		required String queryColumn, 
		required String queryData, 
		required String rollno}) = _UpdateStudentData;
	const factory RepoEvent.loadAppData() = _LoadAppData;
	const factory RepoEvent.loadUserData() = _LoadUserData;
	const factory RepoEvent.loadPeopleData() = _LoadPeopleData;
	const factory RepoEvent.loadCouncilData() = _LoadCouncilData;
	const factory RepoEvent.getAllStudentData() = _GetAllStudentData;
	const factory RepoEvent.getUserStudentData() = _GetUserStudentData;
	// const factory RepoEvent.() = ;
}