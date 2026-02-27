import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ppp/features/auth/create_user/data/models/create_user_request.dart';

class FireStoreUser {
  final CollectionReference usersCollection = FirebaseFirestore.instance
      .collection('users');

  Future<void> addUserToFireStore(CreateUserRequest createUserModel) async {
    return await usersCollection
        .doc(createUserModel.userId)
        .set(createUserModel.toJson());
  }

  Future<DocumentSnapshot> getUserFromFireStore(String userId) async {
    return await usersCollection.doc(userId).get();
  }
}
