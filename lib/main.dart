import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'config/theme.dart';
import 'routes/app_routes.dart';

// Initialize Notification Plugin
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Notification Setup
  var initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
  var initializationSettingsIOS = DarwinInitializationSettings();
  var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid, iOS: initializationSettingsIOS);

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  runApp(TitikMerahApp());
}

class TitikMerahApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TitikMerah',
      theme: AppTheme.themeData, // Use the theme from config
      initialRoute: AppRoutes.initialRoute, // Define routes separately
      routes: AppRoutes.routes, // Manage routes in a separate file
    );
  }
}
