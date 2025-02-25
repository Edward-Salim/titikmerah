import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> showRiskNotification() async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'high_risk_channel',
      'Peringatan Wilayah Rawan Korupsi',
      importance: Importance.high,
      priority: Priority.high,
      color: Colors.red,
      icon: '@mipmap/ic_launcher',
    );

    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await _notificationsPlugin.show(
      0,
      '⚠️ Wilayah Rawan Korupsi',
      'Anda memasuki area dengan tingkat korupsi tinggi! Tetap waspada.',
      platformChannelSpecifics,
    );
  }
}
