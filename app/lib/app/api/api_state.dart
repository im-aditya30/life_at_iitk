part of 'api_bloc.dart';

@freezed

/// contains something if an error occurred
abstract class ApiState with _$ApiState {
  const factory ApiState({
    // required bool loadInProgress,
    // required API apiType,
    required Set<API> load,
		required Option<dynamic> value,
    required Option<Either<ApiFailure, Unit>> apiFailureOrSuccessOption,
  }) = _ApiState;
  factory ApiState.initial() => ApiState(
      // loadInProgress: false,
      // apiType: API.none,
      load: {},
			value: none(),
			apiFailureOrSuccessOption: none());
}

enum API {
  none,
  makeCoordinator,
  prefs,
  fetchCoucil,
  fetchAppData,
  fetchUser,
  fetchPeople,
  publishPost,
  publishDraft,
  makeDraft,
  updatePost,
  requestApproval,
  fetchSUser,
  updateSUser,
  fetchAllPost,
  fetchAllStudent,
  deltPost,
}
