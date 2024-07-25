// ignore_for_file: avoid_print

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sample/Pages/home.dart';

Future<void> signInWithEmailAndPassword(
    context, emailControllerText, passwordControllerText) async {
  await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: emailControllerText,
    password: passwordControllerText,
  );

  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const HomePage()),
  );
}

Future<void> signUpWithEmailAndPassword(String email, String password) async {
  try {
    UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    // User created successfully
    print('User sign up successful: ${userCredential.user!.uid}');
  } catch (e) {
    // Error occurred during sign up
    print('Error signing up: $e');
  }
}

String _generateRandomUserId() {
  final String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
  final String randomId = Random().nextInt(100000).toString().padLeft(5, '0');
  return '$timestamp-$randomId';
}

Future<void> addUserToFirestore(
    double? latitude,
    double? longitude,
    String nameControllerText,
    String emailControllerText,
    String passwordControllerText,
    String phoneNumberControllerText) async {
  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailControllerText,
      password: passwordControllerText,
    );

    // Store user info in Firestore collection
    DocumentReference userDocRef =
        await FirebaseFirestore.instance.collection('users').add({
      'userId': _generateRandomUserId(),
      'name': nameControllerText,
      'email': emailControllerText,
      'phone': phoneNumberControllerText,
      'latitude': latitude,
      'longitude': longitude,
    });

    String userId = userDocRef.id;
    print('User added to Firestore and authenticated');
  } catch (e) {
    print('Error adding user to Firestore and authenticating: $e');
  }
}

Future<bool> verifyAadharNumber(String aadharNumber) async {
  print("Aadhar number: $aadharNumber");
  QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
      .instance
      .collection('aadhar_details')
      .where('aadhar_number', isEqualTo: aadharNumber)
      .get();
  print('Query executed. Number of documents: ${querySnapshot.size}');
  bool isAadharValid = querySnapshot.docs.isNotEmpty;
  print('Aadhar number validity: $isAadharValid');
  return isAadharValid;
}
