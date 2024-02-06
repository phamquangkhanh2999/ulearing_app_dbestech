import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterStates> {
  RegisterBloc() : super(const RegisterStates()) {
    on<UserNameEvent>(_userNameEvent);
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
    on<RePasswordEvent>(_rePasswordEvent);
  }
  void _userNameEvent(UserNameEvent event, Emitter<RegisterStates> emitter) {
    Logger().d("NameEvent ${event.userName}");
    emitter(state.copyWith(username: event.userName));
  }

  void _emailEvent(EmailEvent event, Emitter<RegisterStates> emitter) {
    Logger().d("emailEvent ${event.email}");
    emitter(state.copyWith(email: event.email));
  }

  void _passwordEvent(PasswordEvent event, Emitter<RegisterStates> emitter) {
    Logger().d("passwordEvent ${event.password}");
    emitter(state.copyWith(password: event.password));
  }

  void _rePasswordEvent(
      RePasswordEvent event, Emitter<RegisterStates> emitter) {
    Logger().d("rePasswordEven ${event.rePassword}");
    emitter(state.copyWith(rePassword: event.rePassword));
  }
}
