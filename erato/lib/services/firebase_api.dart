import 'package:erato/home_screen.dart';
import 'package:erato/main.dart';
import 'package:erato/services/notification.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

Future<void> handlebackgroundmessage(RemoteMessage message) async {
  debugPrint('Title : ${message.notification?.title}');
  debugPrint('Body : ${message.notification?.body}');
}

class FirebaseAPI {
  //instance of firebase messaging:

  final _firebasemessaging = FirebaseMessaging.instance;

  //function to initialize the notifications

  Future<void> init_Notifications() async {
    await _firebasemessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    // ignore: non_constant_identifier_names
    final FCMtoken = await _firebasemessaging.getToken();

    debugPrint('Token : $FCMtoken');

    Future initPushNotifications() async {
      await FirebaseMessaging.instance
          .setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );

      Future<void> handleMessage(RemoteMessage message) async {
        if (message == null) return;
        debugPrint('inside handler');
        navigatorKey.currentState
            ?.pushNamed('/notifications', arguments: message);
      }

      FirebaseMessaging.instance
          .getInitialMessage()
          .then((message) => handleMessage(message!));
      FirebaseMessaging.onMessageOpenedApp.listen((event) {
        handleMessage(event);
      });

      FirebaseMessaging.onMessageOpenedApp.listen((event) {
        handleMessage(event);
      });
    }

    FirebaseMessaging.onBackgroundMessage(handlebackgroundmessage);
  }
}
