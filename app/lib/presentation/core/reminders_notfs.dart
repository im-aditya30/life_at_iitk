
import 'dart:convert';
import 'dart:developer';
import 'package:life_at_iitk/main.dart';
import 'package:feature_discovery/feature_discovery.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:hive/hive.dart';
import 'package:life_at_iitk/domain/models/posts.dart';
import 'package:life_at_iitk/domain/notfs/notifs_model.dart';
import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:life_at_iitk/presentation/core/enums.dart';
import 'package:life_at_iitk/presentation/routes/router.gr.dart';
import 'package:life_at_iitk/presentation/screen/home/home_root.dart';

import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;



AndroidNotificationChannel? channel;
// final FlutterLocalNotificationsPlugin reminderNotificationPlugin = FlutterLocalNotificationsPlugin();
// final FlutterLocalNotificationsPlugin flutterLocalNotification = FlutterLocalNotificationsPlugin();
String? timeZone;



/// send isPermission true if it is a approval notification
Future showNotification(Map<String,dynamic> notdata ,bool isPermission) async{
  // print(".........NOTIFICATION IS >>>>>>>>>>>>>> $notification");
	final Notfs schema = Notfs();
  // final notdata = notification;
  final platformChannelSpecificsAndroid = AndroidNotificationDetails(
        'Life@IITK',
        'Life@IITK',
        channelDescription: notdata[schema.sub].toString(),
        category: "msg",
        visibility: NotificationVisibility.public,
        ticker: notdata[schema.sub].toString(),
        importance: Importance.max,
        priority: Priority.high,
        );
    const platformChannelSpecificsIos = IOSNotificationDetails(presentSound: false);
    final platformChannelSpecifics = NotificationDetails(android: platformChannelSpecificsAndroid,iOS: platformChannelSpecificsIos);
    final id = notdata != null && notdata[schema.notfID] != null ?
      int.parse(notdata[schema.notfID] as String).toSigned(31)
      : 2;
    // print(createNotificationPlugin);
    Future.delayed(Duration.zero, () {
      createNotificationPlugin.show(
        id,
        isPermission? 'You have new pending permission request': notdata[schema.title] as String,
        isPermission? 'Check it now' :notdata[schema.message] as String,
        platformChannelSpecifics,
        payload: json.encode(notdata),
      );
    });
    // print("..............SHOW NOTIFICATION FUNCTION ENDS >>>>>>>>>>>>>>>>>");
}

Future<void> configureLocalTimeZone() async {
  try{
    tz.initializeTimeZones();
		
    // timeZone = await FlutterNativeTimezone.getLocalTimezone();
    // final String timeZoneName = await FlutterNativeTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.local);
    // print(timeZoneName);
    // print(tz.local);
  }catch(e){
    log("$e", name: 'Local Time Zone');
  }
}


Future selectCreateNotification(String ?payload) async {
	// if(payload == null || payload.isEmpty) return null;
  log('${Post.fromJson(payload??'').toPostMap()}', name: 'NOTIFICATION PAYLOAD');
  try{
		final router = HomeRoot.innerRouterKey.currentState?.controller;
              //  router?.push(const UsersRoute());
		final Notfs schema = Notfs();
		// await Hive.openBox<String>('notfs');
		// final Box<String> hiveBox = Hive.box<String>('notfs');
		final Map<String,dynamic> data = payload?.isNotEmpty == true ? json.decode(payload!) as Map<String,dynamic> : {};
		if (data.containsKey(schema.type)) {
			if (data[schema.type] == schema.typePermisssion) {
				router?.push(PostDescriptionRoute(index: 0,posts: [Post.fromMap(data)],type: PostDescType.APPROVAL));
			} else if (data[schema.type] == schema.typeCreate ||
				data[schema.type] == schema.typeDraft) {
				router?.push(PostDescriptionRoute(
					index: 0,
					posts: [Post.fromMap(data)],
					type: data[schema.type] == schema.typeCreate ? PostDescType.DISPLAY : PostDescType.DRAFT_POSTS));
			}
		}
		
	}catch(e) {
		log('$e');
	}
}


class ReminderNotification{
  final int? id;
  ReminderNotification({ this.id});
  void setupNotification(
		String notfsDisplay,{ 
		required Post reminder,
		required tz.TZDateTime time}){
    // print("SUB ${reminder.sub[0]}");
    final platformChannelSpecificsAndroid = AndroidNotificationDetails(
    'in.sntiitk.life',
    'Life@IITK',
    channelDescription: reminder.sub[0].toString(),
    styleInformation: const DefaultStyleInformation(true, true),
    category: "reminder",
    visibility: NotificationVisibility.public,
    ledColor: Colors.blueGrey,
    ticker: reminder.sub[0].toString(),
    ledOnMs: 1000,
    ledOffMs: 300,
    importance: Importance.max,
    priority: Priority.high);
    const platformChannelSpecificsIos = IOSNotificationDetails(presentSound: false);
    final platformChannelSpecifics = NotificationDetails(android: platformChannelSpecificsAndroid, iOS: platformChannelSpecificsIos);
    int? id;
    id = reminder.timeStamp.toSigned(31);
    // print(id);
    Future.delayed(Duration.zero, () {
			createNotificationPlugin.zonedSchedule(
        id??1,
        reminder.title,
        notfsDisplay,
        time,
        platformChannelSpecifics,
        uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.wallClockTime,
        payload: json.encode(reminder.toMap()),
        androidAllowWhileIdle: true,
      );
    });
  }
  // ignore: avoid_void_async
  void get cancelAll async => await createNotificationPlugin.cancelAll();
  // ignore: avoid_void_async
  void get cancel async{
		try {
			await createNotificationPlugin.cancel(id!);
		} catch (onError) {
			log("$onError");
		}
	}
}