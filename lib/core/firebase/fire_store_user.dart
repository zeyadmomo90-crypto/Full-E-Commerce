import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ppp/core/firebase/user_model.dart';

class FireStoreUser {
  final CollectionReference usersCollection = FirebaseFirestore.instance
      .collection('users');

  Future<void> addUserToFireStore(UserModel userModel) async {
    return await usersCollection.doc(userModel.userId).set(userModel.toJson());
  }
}
