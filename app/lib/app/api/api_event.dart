part of 'api_bloc.dart';

@freezed
abstract class ApiEvent with _$ApiEvent {
  const factory ApiEvent.fetchAppData() = FetchAppData;
  const factory ApiEvent.fetchCouncilData() = FetchCouncilData;
  const factory ApiEvent.fetchUserData() = FetchUserData;
  const factory ApiEvent.fetchPeopleData() = FetchPeopleData;
  const factory ApiEvent.makeCoordinator({
		required String id,
		required String council,
		required String sub,
	}) = MakeCoordinator;
  const factory ApiEvent.updatePreferences({
		// required Map<String,dynamic> council,
		required Prefs prefs
	}) = UpdatePreferences;
  const factory ApiEvent.publishPost({
		required String postUid,
	}) = PublishPost;
  const factory ApiEvent.requestPostApproval({
		required Post post,
	}) = RequestPostApproval;
  const factory ApiEvent.updatePost({required Post post}) = UpdatePost;
  const factory ApiEvent.makeDraft({
		required Post post,
	}) = MakeDraft;
  const factory ApiEvent.publishDraft({
		required String postUid,
	}) = PublishDraft;
  const factory ApiEvent.updateSUserData({
		required List<String> reminder,
		required List<String> bookmark,
	}) = UpdateSUserData;
  const factory ApiEvent.fetchSUserData({
		required List<String> reminder,
		required List<String> bookmark,
	}) = FetchSUserData;
  const factory ApiEvent.fetchAllPost({
		required int timeStamp
	}) = FetchAllPost;
  const factory ApiEvent.fetchPostWithId({
		required String postUid,
	}) = FetchPostWithId;
  const factory ApiEvent.fetchPostWithTypeCouncil({
		required String type,
		required String council,
	}) = FetchPostWithTypeCouncil;
  const factory ApiEvent.fetchAllStudentsData() = FetchAllStudentsData;
  const factory ApiEvent.updateStudentData({
		required String rollNo,
		required MapEntry<String,String> value
	}) = UpdateStudentData;
	const factory ApiEvent.deletePost({
		required Post post,
		// required String value
	}) = DeletePost;
}