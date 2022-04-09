import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:life_at_iitk/domain/models/posts.dart';

import '../database_failure.dart';



abstract class PostDBInterface {
  Future<List<Post>> getAllPosts();
  Future<Either<DBFailure,List<Post>>> getAllBookmarkedPosts();
  Stream<Post> getPost({required String postId});
  Stream<List<Post>> watchPostsWithPrefs(List<String> prefs, int limit);
  Stream<List<Post>> watchAllPosts();
  Stream<List<Post>> watchAllFeaturedPosts();
  Stream<List<Post>> watchAllOngoingEvents();
  Stream<List<Post>> watchAllUpcomingEvents();
  Stream<List<Post>> watchAllReminders(DateTime date);
  Stream<List<Post>> watchAllPendingApproval({
		required String council,  
		required bool isLevel2, 
		required String owner});
  // Stream<List<Post>> watchUpdateSection();
  Stream<List<Post>> watchUpdateDraftSection({
		required String council,  
		required bool isUpdate, 
		required String owner});
  Future<Either<DBFailure,Unit>> insertPost(Post post);
  Future<Either<DBFailure,Unit>> insertMultiplePost({
		required List data, 
		required String owner});

  ///Returns the amount of rows that were deleted by this statement directly (not including additional rows that might be affected through triggers or foreign key constraints).
  Future<int> deletePost(Post post);
  Future<Either<DBFailure,bool>> updatePost(Post post);
  // ignore: avoid_positional_boolean_parameters
  Future<Either<DBFailure,int>> toggleBookmarkReminder(Post post,bool isBookmark);
	Future<Map<DateTime, List<Post>>> getAllPostBetweenDate(DateTime date, DateTime endDate);
	Future<void> deleteAllPosts();
}