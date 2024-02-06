import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:ulearning_app/common/widgets/flutter_toast.dart';
import 'package:ulearning_app/page/sign_in/bloc/signin_blocs.dart';

class SignInController {
  final BuildContext context;

  const SignInController({required this.context});

  void handleSignIn(String type) async {
    try {
      if (type == "email") {
        final state = context.read<SignInBloc>().state;
        String emailAddress = state.email;
        String password = state.password;
        if (emailAddress.isEmpty) {}
        if (password.isEmpty) {}

        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress, password: password);
          if (credential.user == null) {
            toastInfo(msg: "Người dùng không tồn tại.");
          }
          if (!credential.user!.emailVerified) {
            toastInfo(msg: "không khác biệt");
          }
          var user = credential.user;

          if (user != null) {
            toastInfo(msg: "người dùng tồn tại");
          } else {
            toastInfo(msg: "không có người dùng");
            return;
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            toastInfo(msg: "Không tìm thấy người dùng nào cho email đó.");
            return;
          } else if (e.code == 'wrong-password') {
            toastInfo(msg: "Mật khẩu sai được cung cấp cho người dùng đó.");
            return;
          } else if (e.code == 'invalid-email') {
            toastInfo(
                msg: "Email không hợp lệ được cung cấp cho người dùng đó.");
            return;
          }
        }
      }
    } catch (e) {
      toastInfo(msg: "Pham Quang khanh ${e.toString()}");
    }
  }
}
