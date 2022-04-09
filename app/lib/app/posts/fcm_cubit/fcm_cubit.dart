import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:life_at_iitk/app/core/functions.dart';
import 'package:life_at_iitk/domain/models/posts.dart';
import 'package:life_at_iitk/domain/notfs/notifs_model.dart';
import 'package:life_at_iitk/infrastructure/database/moor/posts/database_class.dart';
import 'package:life_at_iitk/presentation/core/enums.dart';
import 'package:life_at_iitk/presentation/routes/router.gr.dart';

part 'fcm_state.dart';
part 'fcm_cubit.freezed.dart';

@injectable
class FcmCubit extends Cubit<FcmState> {
	final FirebaseMessaging _fcm;
	final Fcm _fcmFunction;
  FcmCubit(this._fcm, this._fcmFunction) : super(const FcmState.startService());

	Future<void> startFCM(BuildContext context) async{
		log("started FCM");
			final FirebaseMessaging messaging = FirebaseMessaging.instance;
			await messaging.setAutoInitEnabled(true);
			FirebaseMessaging.onMessage.listen((message) {
				_fcmFunction.onMessage(message.data);
			});
			final Notfs schema = Notfs();
			FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
				log('A new onMessageOpenedApp event was published!', name: 'FCM');
				final Map<String, dynamic> data = message.data["data"] as Map<String, dynamic>;
				AutoRouter.of(context).push(PostDescriptionRoute(
					index: 0,
					posts: [Post.fromMap(data)],
					type: (data.containsKey(schema.type)) ?
					((data[schema.type] == schema.typePermisssion)?
						PostDescType.APPROVAL
					: PostDescType.DISPLAY
					) : PostDescType.DISPLAY
				));
			});
	}
	Future<void> subsUnsubsTopic({
		required List<String> subscribe,
		required List<String> unsubscribe,
	}) async{
		// final subs = subscribe.removeAllSpaces;
		// final unsubs = unsubscribe.removeAllSpaces;
		// log(subs.toString(),name:'Subscribe');
		// log(unsubs.toString(),name:'Unsubscribe');
		// print(subscribe.length.toString());
		await _fcmFunction.subscribeUnsubsTopic(subscribe.removeAllSpaces, unsubscribe.removeAllSpaces);
	}

	
}



// extension StingX on String {
//   String get makeValidString => replaceAll(" ", "_").replaceAll("'", "");
// }
