import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> updateUser(String userId, String key, dynamic value) {
  return FirebaseFirestore.instance.collection('users')
      .doc(userId)
      .update({key: value})
      .then((value) => print("User Updated"))
      .catchError((error) => print("Failed to update user: $error"));
}