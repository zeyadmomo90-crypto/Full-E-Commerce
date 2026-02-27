import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ppp/core/firebase/fire_store_user.dart';
import 'package:ppp/core/routing/routers.dart';
import 'package:ppp/features/auth/create_user/data/models/create_user_request.dart';

class AuthModel {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController userPicController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FireStoreUser fireStoreUser = FireStoreUser();
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
  }

  Future<void> login(BuildContext context) async {
    try {
      final userCredential = await auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      log('Login Success: ${userCredential.user?.uid}');
      log('Email: ${userCredential.user?.email}');

      context.go(Routers.shopLayout);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No user found for that email.')),
        );
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Wrong password provided for that user.'),
          ),
        );
        log('Wrong password provided for that user.');
      }
    } catch (e) {
      log('Login Error: $e');
    }
  }

  Future<void> signOut(BuildContext context) async {
    try {
      await auth.signOut();
      log('User signed out successfully.');

      context.go(Routers.loginScreen);
    } catch (e) {
      log('Sign Out Error: $e');
    }
  }

  Future<void> createAccountWithEmailAndPassword(BuildContext context) async {
    try {
      final userCredential = await auth.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      final user = userCredential.user;

      if (user == null) {
        throw Exception('User creation failed');
      }

      await fireStoreUser.addUserToFireStore(
        CreateUserRequest(
          email: user.email ?? '',
          name: nameController.text.trim(),
          avatar: userPicController.text.trim(),
          userId: user.uid,
        ),
      );

      context.push(Routers.shopLayout);
    } catch (e) {
      await auth.currentUser?.delete();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Account creation failed. Try again.')),
      );

      log('Error creating account: $e');
    }
  }
}
