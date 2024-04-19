import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  
  const NotificationsScreen(RemoteMessage message, {super.key,});

  @override
  
  Widget build(BuildContext context) {
    RemoteMessage? message = ModalRoute.of(context)!.settings.arguments as RemoteMessage?;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(message!.notification!.title ?? ''),
            Text(message!.notification!.body ?? ''),
          ],
        ),
      ),
    );
  }
}