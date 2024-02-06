import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:ulearning_app/common/widgets/flutter_toast.dart';
import 'package:ulearning_app/page/register/bloc/register_bloc.dart';

class RegisterController {
  final BuildContext context;

  const RegisterController({required this.context});

  void handleEmailRegister() async {
    final state = context.read<RegisterBloc>().state;
    Logger().d("Khanh Satet ${state.toString()}");
    String username = state.username;
    String email = state.email;
    String password = state.password;
    String rePassword = state.rePassword;

    if (_validateInput(state)) {
      // Proceed with registration logic
      Logger().d("Chao khanh ");
      // BlocProvider.of<RegisterBloc>(context).add(RegisterEvent(
      //     username: username,
      //     email: email,
      //     password: password,
      //     rePassword: rePassword));
      try {
        final credential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        if (credential.user != null) {
          await credential.user?.sendEmailVerification();
          await credential.user?.updateDisplayName(username);
          toastInfo(
              msg:
                  "Một email đã được gửi đến email đăng ký của bạn. để kích hoạt nó, vui lòng kiểm tra");
          Navigator.of(context).pop();
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          toastInfo(msg: "The password provided is to weak");
        } else if (e.code == 'email-already-in-use') {
          toastInfo(msg: "Email already in use");
        } else if (e.code == 'weak-password') {
          toastInfo(msg: "The password provided is to weak");
        }
      }
    }
  }

  bool _validateInput(RegisterStates state) {
    if (state.username.isEmpty) {
      toastInfo(msg: "Username can not be empty.");
      return false;
    }

    if (!isValidEmail(state.email)) {
      toastInfo(msg: "Invalid email format.");
      return false;
    }

    if (state.password.isEmpty) {
      toastInfo(msg: "Password can not be empty.");
      return false;
    }

    if (state.password.length < 6) {
      toastInfo(msg: "Password should be at least 6 characters.");
      return false;
    }

    if (state.rePassword.isEmpty) {
      toastInfo(msg: "RePassword can not be empty.");
      return false;
    }

    if (state.password != state.rePassword) {
      toastInfo(msg: "Passwords do not match.");
      return false;
    }

    return true;
  }

  bool isValidEmail(String email) {
    // Use a regular expression or any suitable method to check the email format
    // For simplicity, we check if it contains '@' symbol
    return email.contains('@');
  }
}
