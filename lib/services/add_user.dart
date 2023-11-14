import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future addDriver(
    fname, lname, contactNumber, address, license, vehicle, platenumber) async {
  final docUser = FirebaseFirestore.instance.collection('Drivers').doc();

  final json = {
    'fname': fname,
    'lname': lname,
    'contactNumber': contactNumber,
    'address': address,
    'license': license,
    'vehicle': vehicle,
    'platenumber': platenumber,
    'profilePicture': 'https://cdn-icons-png.flaticon.com/256/149/149071.png',
    'type': 'Driver',
    'dateTime': DateTime.now(),
    'uid': FirebaseAuth.instance.currentUser!.uid
  };

  await docUser.set(json);
}
