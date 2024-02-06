import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/page/register/bloc/register_bloc.dart';
import 'package:ulearning_app/page/sign_in/bloc/signin_blocs.dart';
import 'package:ulearning_app/page/welcome/bloc/welcome_blocs.dart';

class AppBlocProviders {
  static get allBlocProviders => [
        BlocProvider(
          lazy: false,
          create: (context) => WelcomeBloc(),
        ),
        BlocProvider(
          create: (context) => SignInBloc(),
        ),
        BlocProvider(
          create: (context) => RegisterBloc(),
        ),
      ];
}
