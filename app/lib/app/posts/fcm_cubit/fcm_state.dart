part of 'fcm_cubit.dart';

@freezed
abstract class FcmState with _$FcmState {
	const factory FcmState.startService() = _StartService;
	const factory FcmState.subsUnsubsTopic() = _SubsUnsubsTopic;
	// const factory FcmState.newMessage() = _NewMessage;
}
