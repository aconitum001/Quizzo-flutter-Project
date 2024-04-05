import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quiz_app/pages/firebase_services.dart/auth.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> LoginUser({required email, required password}) async {
    emit(LoginLoading());
    try {
      await signInUser(email, password);
      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == "invalid-email") {
        emit(LoginFailure(errMessage: "The email address is badly formatted."));
      } else if (e.code == 'invalid-credential') {
        emit(LoginFailure(errMessage: "No user found for that email."));
      }
    } catch (e) {
      emit(LoginFailure(errMessage: e.toString()));
    }
  }

  @override
  void onChange(Change<LoginState> change) {
    // TODO: implement onChange
    super.onChange(change);
    print(change);
  }
}
