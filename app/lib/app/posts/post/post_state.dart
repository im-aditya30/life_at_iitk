part of 'post_cubit.dart';

@freezed
abstract class PostState with _$PostState {
  const factory PostState.initial() = _Initial;
  const factory PostState.initialisingPage() = InitialisingPage;
  const factory PostState.loadedPage(List<PostTile> posts) = LoadedPage;
  const factory PostState.toggleBookmark(PostTile postTile, int index) = ToggleBookmark;
  const factory PostState.togglingBookmark(PostTile postTile) = ToggingBookmark;
  const factory PostState.toggleReminder(PostTile postTile) = ToggleReminder;
  const factory PostState.failure(DBFailure dbFail, PostFailure f, PostTile postTile) = Failure;
}

enum PostFailure {
	/// index = 1
	reminder,
	/// index = 2
	bookmark,
	/// index = 3
	pageLoad
}
