import 'package:ulearning_app/page/sign_in/sign_in.dart';

abstract class SignInEvent {
  const SignInEvent();
}

class EmailEvent extends SignInEvent {
  final String email;

  const EmailEvent(this.email);
}

class PasswordEvent extends SignInEvent {
  final String password;
  const PasswordEvent(this.password);
}
