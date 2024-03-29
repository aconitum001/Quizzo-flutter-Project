import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/pages/firebase_services.dart/auth.dart';
import 'package:quiz_app/pages/firebase_services.dart/firestore.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());

  Future<void> signUpUser(
      {required String userName,
      required String email,
      required password}) async {
    emit(SignupLoading());
    try {
      await addUser(email, password);
      await addUserDetails(email: email, userInfo: {
        "email": email,
        "username": userName,
        "password": password
      });
      emit(SignupSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        emit(
          SignupFailure(errMessage: 'The email address is badly formatted.'),
        );
      }
      if (e.code == 'weak-password') {
        emit(
          SignupFailure(errMessage: 'The password provided is too weak.'),
        );
      } else if (e.code == 'email-already-in-use') {
        emit(
          SignupFailure(
              errMessage: 'The account already exists for that email.'),
        );
      }
    } catch (e) {
      print(e);
      emit(
        SignupFailure(errMessage: e.toString()),
      );
    }
  }
}
