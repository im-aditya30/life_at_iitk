import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:life_at_iitk/domain/database/database_failure.dart';
import 'package:life_at_iitk/domain/database/database_interface.dart';
import 'package:life_at_iitk/domain/database/posts/post_db_interface.dart';
import 'package:life_at_iitk/domain/models/posts.dart';

part 'post_state.dart';
part 'post_cubit.freezed.dart';

@injectable
class PostCubit extends Cubit<PostState> {
	final DBInterface _dbInterface;
	final PostDBInterface _postDBInterface;
  PostCubit(this._dbInterface, this._postDBInterface) : super(const PostState.initial());

	Future<void> toggleReminder(PostTile postTile) async {
		final possibleError = await _postDBInterface.toggleBookmarkReminder(postTile.post, false);
			possibleError.fold(
					(l) => emit(PostState.failure(l, PostFailure.reminder,postTile)), 
					(_) => emit(PostState.toggleReminder(postTile)));
	}

	Future<void> toggleBookmark(PostTile postTile, {int index = -1}) async {
		// await Future.delayed(const Duration(seconds: 4), (){});
		emit(PostState.togglingBookmark(postTile));
		final possibleError = await _postDBInterface.toggleBookmarkReminder(postTile.post, true);
			possibleError.fold(
					(l) => emit(PostState.failure(l, PostFailure.bookmark, postTile)), 
					(_) => emit(PostState.toggleBookmark(postTile,index)));
	}

	Future<void> loadAllBoookmark() async {
		emit(const PostState.initialisingPage());
		final possibleError = await _postDBInterface.getAllBookmarkedPosts();
		possibleError.fold(
			(l) => emit(PostState.failure(l, PostFailure.bookmark, const PostTile(post: Post()))), 
			(r) => emit(PostState.loadedPage(r.map((e) => PostTile(post: e)).toList()))
		);
	}

	Future<void> loadAllReminder() async {
		emit(const PostState.initialisingPage());
	}
}
