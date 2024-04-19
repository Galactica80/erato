import 'package:erato/home_screen.dart';
import 'package:erato/main.dart';
import 'package:erato/services/notification.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  debugPrint('Title: ${message.notification?.title}');
  debugPrint('Body: ${message.notification?.body}');
}

class FirebaseAPI {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    try {
      await _firebaseMessaging.requestPermission();
      final fcmToken = await _firebaseMessaging.getToken();
      debugPrint('Token: $fcmToken');

      await _firebaseMessaging.setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );

      void handleMessage(RemoteMessage message) {
        if (message == null) return;
        debugPrint('Inside handler');
        navigatorKey.currentState?.pushNamed('/notifications', arguments: message);
      }

      _firebaseMessaging.getInitialMessage().then((message) => handleMessage(message!));
      FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
      FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    } catch (e) {
      debugPrint('Error initializing notifications: $e');
    }
  }
}
