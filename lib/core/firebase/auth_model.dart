import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:ppp/core/firebase/fire_store_user.dart';
import 'package:ppp/features/auth/create_user/data/models/create_user_request.dart';

class AuthModel {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FireStoreUser fireStoreUser = FireStoreUser();

  Future<void> login({required String email, required String password}) async {
    try {
      final userCredential = await auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      log('Login Success: ${userCredential.user?.uid}');
      log('Email: ${userCredential.user?.email}');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        log('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        log('Wrong password provided for that user.');
      }
    } catch (e) {
      log('Login Error: $e');
    }
  }

  Future<void> signOut() async {
    try {
      await auth.signOut();
      log('User signed out successfully.');
    } catch (e) {
      log('Sign Out Error: $e');
    }
  }

  Future<void> createAccountWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
    required String avatar,
  }) async {
    try {
      final userCredential = await auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      final user = userCredential.user;
      if (user == null) throw Exception('User creation failed');

      await fireStoreUser.addUserToFireStore(
        CreateUserRequest(
          email: user.email ?? '',
          name: name.trim(),
          avatar: avatar.trim(),
          userId: user.uid,
        ),
      );
    } catch (e) {
      await auth.currentUser?.delete();
      log('Error creating account: $e');
    }
  }
}
