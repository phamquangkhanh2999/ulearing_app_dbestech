import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/page/register/bloc/register_bloc.dart';
import 'package:ulearning_app/page/register/regiter_controller.dart';

import '../common_widgets.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterStates>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: buildAppBar("Sign Up"),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                        child: reusableText(
                            "Enter your details below & free sign up")),
                    Container(
                      margin: EdgeInsets.only(top: 66.h),
                      padding: EdgeInsets.only(left: 25.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          reusableText("User name"),
                          buildTextField("Enter your user name", "name", "user",
                              (value) {
                            context
                                .read<RegisterBloc>()
                                .add(UserNameEvent(value));
                          }),
                          SizedBox(
                            height: 5.h,
                          ),
                          reusableText("Email"),
                          buildTextField(
                              "Enter your email address", "email", "user",
                              (value) {
                            context.read<RegisterBloc>().add(EmailEvent(value));
                          }),
                          SizedBox(
                            height: 5.h,
                          ),
                          reusableText("Password"),
                          buildTextField(
                              "Enter your password", "password", "lock",
                              (value) {
                            context
                                .read<RegisterBloc>()
                                .add(PasswordEvent(value));
                          }),
                          reusableText("Confirm Password"),
                          buildTextField(
                              "Enter your Confirm Password", "password", "lock",
                              (value) {
                            context
                                .read<RegisterBloc>()
                                .add(RePasswordEvent(value));
                          }),
                          reusableText(
                              "By creating an account, you have to agree with our them & condition"),
                          buildLogInAdnRegButton("Sign Up", "login", () {
                            RegisterController(context: context)
                                .handleEmailRegister();
                          }),
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
