import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/auth-feature/models/user.dart';

class FirestoreService {
  final CollectionReference users = FirebaseFirestore.instance.collection(
    'users',
  );

  // Create
  Future addUser(AppUser user) {
    return users.add({
      'firstName': user.firstName,
      'lastName': user.lastName,
      'phone': user.phone,
      'email': user.email,
      'timeStamp': Timestamp.now(),
    });
  }

  // Read
  Stream<DocumentSnapshot> getCurrentUserStream(String uid) {
    return users.doc(uid).snapshots();
  }
}
