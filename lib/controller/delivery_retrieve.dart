import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DeliveryRetrieve {
  Future<void> retrieve() async {
    var firebaseUser = FirebaseAuth.instance.currentUser;
    String uid = FirebaseAuth.instance.currentUser.uid;
    print(uid);
    FirebaseFirestore.instance.collection("Users").get().then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        FirebaseFirestore.instance
            .collection("Users")
            .doc(result.id)
            .collection("MyPackages")
            .get()
            .then((querySnapshot) {
          querySnapshot.docs.forEach((result) {
            print(result.data());
          });
        });
      });
    });

    // FirebaseFirestore.instance
    //     .collection('Users')
    //     .doc(uid)
    //     .collection('MyPackages')
    //     .get()
    //     .then((QuerySnapshot querySnapshot) {
    //   querySnapshot.docs.forEach((doc) {
    //     print(doc["delivery_date"]);
    //     print(doc["status"]);
    //   });
    // });
  }
}