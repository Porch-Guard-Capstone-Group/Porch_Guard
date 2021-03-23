import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class delivery_retrieve {
  Future<void> retrieve() async {
    String uid = FirebaseAuth.instance.currentUser.uid;
    FirebaseFirestore.instance
        .collection('Users')
        .doc(uid)
        .collection('MyPackages')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print(doc["delivery_date"]);
        print(doc["status"]);
      });
    });
  }
}