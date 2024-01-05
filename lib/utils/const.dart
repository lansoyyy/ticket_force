import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

enum RegistrationType { Production, Independent, Client }

final Stream<DocumentSnapshot> userData = FirebaseFirestore.instance
    .collection('enforcers')
    .doc(FirebaseAuth.instance.currentUser!.uid)
    .snapshots();
