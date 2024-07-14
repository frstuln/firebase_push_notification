import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_project/main.dart';
import 'package:firebase_project/util/services/api_service.dart';
import 'package:firebase_project/util/services/auth_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final _firebaseMessaging = FirebaseMessaging.instance;
  static final FlutterLocalNotificationsPlugin
      _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  // request notification permission
  static Future initPermission() async {
    await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: false,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );

    // get the device fcm token
    // final fcmToken = await _firebaseMessaging.getToken();
    // print('Device token : $fcmToken');
  }

  static Future getDeviceToken() async {
    final fcmToken = await _firebaseMessaging.getToken();
    print('Device token : $fcmToken');

    bool isUserLoggedIn = await AuthService.isLoggedIn();
    if (isUserLoggedIn) {
      await ApiService.saveUserToken(fcmToken!);
      print('Data has been saved in firestore');
    }

    // also sacve the token if token has changed
    _firebaseMessaging.onTokenRefresh.listen((event) async {
      if (isUserLoggedIn) {
        await ApiService.saveUserToken(fcmToken!);
        print('Saved Fcm token to firestore');
      }
    });
  }

  // initialize local notifications
  static localNotificationInit() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );
    final DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
      onDidReceiveLocalNotification: (id, title, body, payload) => null,
    );
    final LinuxInitializationSettings initializationSettingsLinux =
        LinuxInitializationSettings(defaultActionName: 'Open notification');
    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsDarwin,
            linux: initializationSettingsLinux);

    // request notification permissions for android 13 or above
    _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()!
        .requestNotificationsPermission();

    _flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveBackgroundNotificationResponse: onNotificationTap,
        onDidReceiveNotificationResponse: onNotificationTap);
  }

  // on tap local notification in foreground
  static void onNotificationTap(NotificationResponse notificationResponse) {
    navigatorKey.currentState!
        .pushNamed('/message', arguments: notificationResponse);
  }

  // show a simple notification
  static Future showSimpleNotification({
    required String title,
    required String body,
    required String payload,
  }) async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      'Channel Id',
      'Channel Name',
      channelDescription: 'Channel Description',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
    );
    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await _flutterLocalNotificationsPlugin
        .show(0, title, body, notificationDetails, payload: payload);
  }
}
