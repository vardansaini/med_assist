import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

Future<void> updateUser(String userId, String key, dynamic value) {
  return FirebaseFirestore.instance.collection('users')
      .doc(userId)
      .update({key: value})
      .then((value) => print('User Updated'))
      .catchError((error) => print('Failed to update user: $error'));
}

Future<void> requestHelp(String userId) async {
  return FirebaseFunctions.instance.httpsCallable('sendHelpAlert').call(userId);
}

Future<void> saveTokenToDatabase(String token) async {
  await FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser.uid)
      .update({'tokens': FieldValue.arrayUnion([token])});
}

Future<void> requestNotifications() async {
  await saveTokenToDatabase(await FirebaseMessaging().getToken());
  FirebaseMessaging().onTokenRefresh.listen(saveTokenToDatabase);

  const channel = AndroidNotificationChannel(
  'med_assist',
  'Medical Emergencies',
  'This channel is used to notify emergency help requests.',
  importance: Importance.max,
  );

  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);
}