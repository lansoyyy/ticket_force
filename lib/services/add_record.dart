import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future addRecord(name, license, violations) async {
  final docUser = FirebaseFirestore.instance.collection('Record').doc();

  final json = {
    'name': name,
    'license': license,
    'violations': violations,
    'profilePicture': 'https://cdn-icons-png.flaticon.com/256/149/149071.png',
    'type': 'Driver',
    'dateTime': DateTime.now(),
    'uid': FirebaseAuth.instance.currentUser!.uid,
    'id': docUser.id
  };

  await docUser.set(json);
}
