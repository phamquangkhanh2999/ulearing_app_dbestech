import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/page/sign_in/bloc/signin_blocs.dart';
import 'package:ulearning_app/page/sign_in/bloc/signin_events.dart';
import 'package:ulearning_app/page/sign_in/bloc/signin_states.dart';
import 'package:ulearning_app/page/sign_in/sign_in_controller.dart';
import '../common_widgets.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: buildAppBar("Log In"),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildThirdPartyLogin(context),
                    Center(
                        child: reusableText("Or use your email account login")),
                    Container(
                      margin: EdgeInsets.only(top: 66.h),
                      padding: EdgeInsets.only(left: 25.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          reusableText("Email"),
                          buildTextField(
                              "Enter your email address", "Email", "user",
                              (value) {
                            context.read<SignInBloc>().add(EmailEvent(value));
                          }),
                          SizedBox(
                            height: 5.h,
                          ),
                          reusableText("Password"),
                          buildTextField(
                              "Enter your password", "password", "lock",
                              (value) {
                            context
                                .read<SignInBloc>()
                                .add(PasswordEvent(value));
                          }),
                          forgotPassword(),
                          buildLogInAdnRegButton("Login", "login", () {
                            SignInController(context: context).handleSignIn(
                              "email",
                            );
                          }),
                          buildLogInAdnRegButton("Register", "register", () {
                            Navigator.of(context).pushNamed("register");
                          })
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
