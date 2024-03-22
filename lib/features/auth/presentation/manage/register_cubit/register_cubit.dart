import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:read_it/constants.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  Future<void> registerUser({
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String email,
    required String password,
  }) async {
    try {
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      saveUser(
          email: email,
          firstName: firstName,
          lastName: lastName,
          phoneNumber: phoneNumber);
      emit(RegisterSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        emit(RegisterFailure(errMessage: 'Email already on use'));
      } else if (e.code == 'weak-password') {
        log(e.code);
        emit(RegisterFailure(errMessage: 'Weak password'));
      } else if (e.code == 'invalid-email') {
        emit(RegisterFailure(errMessage: 'Invalid Email'));
      } else {
        log(e.code);
        emit(RegisterFailure(errMessage: 'Something wrong'));
      }
    } catch (ex) {
      emit(RegisterFailure(errMessage: 'Something wrong'));
    }
  }

  void saveUser({
    required String email,
    required String firstName,
    required String lastName,
    required String phoneNumber,
  }) async {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection(
      kUserCollection,
    );
    await collectionReference.doc(email).set({
      kUserName: '$firstName $lastName',
      kEmail: email,
      kPhoneNumber: phoneNumber
    });
  }
}
