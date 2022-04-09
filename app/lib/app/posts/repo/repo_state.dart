part of 'repo_bloc.dart';

@freezed
abstract class RepoState with _$RepoState {
  // const factory RepoState.initial() = Initial;
  // const factory RepoState.loadInProgress() = LoadInProgress;
  // const factory RepoState.loadedApp(List data) = LoadedApp;
  // const factory RepoState.loadSuccess(List<Post> posts) = LoadSuccess;
  // const factory RepoState.loadFailure(Failure repoFailure) = LoadFailure;
	const factory RepoState({
		required bool isLoading,
		required bool isAppLoading,
		required bool showError,
		required Option<List<List<Post>>> appData,
		// required Failure failure,
		required Option<Either<Failure, dynamic>> dbFailureOrSuccess,
	}) = _RepoState;
	factory RepoState.initial() => RepoState(
		dbFailureOrSuccess: none(),
		appData: none(),
		isAppLoading: false,
		isLoading: false,
		showError: false,
	);

}
