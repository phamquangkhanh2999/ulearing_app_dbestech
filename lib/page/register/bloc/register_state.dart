part of 'register_bloc.dart';

class RegisterStates {
  final String username;
  final String email;
  final String password;
  final String rePassword;

  // optional named parameters
  const RegisterStates(
      {this.username = "",
      this.email = "",
      this.password = "",
      this.rePassword = ""});

  RegisterStates copyWith(
      {String? username, String? email, String? password, String? rePassword}) {
    return RegisterStates(
        username: username ?? this.username,
        email: email ?? this.email,
        password: password ?? this.password,
        rePassword: rePassword ?? this.rePassword);
  }
}
