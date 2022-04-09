


import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hive/hive.dart';
import 'package:flutter/scheduler.dart' as sh;
import 'package:hive_flutter/hive_flutter.dart';
import 'package:life_at_iitk/presentation/core/reminders_notfs.dart';
import 'package:life_at_iitk/presentation/core/widgets/flush_toast.dart';
import 'package:life_at_iitk/infrastructure/core/injectionable_module.dart';
import 'app/core/functions.dart';
import 'infrastructure/database/hive_class.dart';
import 'injection.dart';

import 'presentation/core/app.dart';

FlutterLocalNotificationsPlugin createNotificationPlugin =  FlutterLocalNotificationsPlugin();

Future<void> main() async{
	WidgetsFlutterBinding.ensureInitialized();
  sh.timeDilation = 1.0;
	await Future.value([
    await configureLocalTimeZone(),
		await Firebase.initializeApp(),
		await Hive.initFlutter()
	]);
	await configureInjection();
	const HiveDatabase().registerAllAdapters();
	channel = const AndroidNotificationChannel(
      'in.sntiitk.life',
        'Life@IITK',// title
      description: 'Important Notifications', // description
      importance: Importance.high,
    );

	await createNotificationPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel!);
  const initializationSettingsAndroid = AndroidInitializationSettings('launch');
  const initializationSettingsIOS = IOSInitializationSettings();
  const initializationSettings = InitializationSettings(
    android : initializationSettingsAndroid,iOS:  initializationSettingsIOS);
	await Future.value([
		await const HiveDatabase().openAllBoxes(),
  	await createNotificationPlugin.initialize(initializationSettings,
    	onSelectNotification: selectCreateNotification).then((value) {
				if(value == true){
					FirebaseMessaging.onBackgroundMessage(onBackgroundMessage);
				}
			}), 
		await Hive.openBox<String>('theme'),
	]);
  runApp(App());
}

