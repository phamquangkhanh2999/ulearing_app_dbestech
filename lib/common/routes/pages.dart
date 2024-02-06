import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:ulearning_app/common/routes/routers.dart';
import 'package:ulearning_app/page/application/application_page.dart';
import 'package:ulearning_app/page/register/bloc/register_bloc.dart';
import 'package:ulearning_app/page/register/register.dart';
import 'package:ulearning_app/page/sign_in/bloc/signin_blocs.dart';
import 'package:ulearning_app/page/sign_in/sign_in.dart';
import 'package:ulearning_app/page/welcome/bloc/welcome_blocs.dart';
import 'package:ulearning_app/page/welcome/welcome.dart';

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
          router: AppRouter.INITIAL,
          page: const WelcomeScreen(),
          bloc: BlocProvider(create: (_) => WelcomeBloc())),
      PageEntity(
          router: AppRouter.SIGN_IN,
          page: const SignIn(),
          bloc: BlocProvider(create: (_) => SignInBloc())),
      PageEntity(
          router: AppRouter.REGISTER,
          page: const Register(),
          bloc: BlocProvider(create: (_) => RegisterBloc())),
      PageEntity(
        router: AppRouter.APPLICATION,
        page: const WelcomeScreen(),
      ),
    ];
  }

  // return all the bloc
  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];

    for (var bloc in routes()) {
      if (bloc.bloc != null) blocProviders.add(bloc.bloc);
    }
    Logger().d("$blocProviders");
    return blocProviders;
  }

  static MaterialPageRoute GenerateRouterSettings(RouteSettings settings) {
    if (settings.name != null) {
      var result = routes().where((element) => element.router == settings.name);
      if (result.isNotEmpty) {
        return MaterialPageRoute(
            builder: (context) => result.first.page, settings: settings);
      }
    }
    return MaterialPageRoute(
        builder: (_) => const SignIn(), settings: settings);
  }
}

class PageEntity {
  String router;
  Widget page;
  dynamic bloc;

  PageEntity({required this.router, required this.page, this.bloc});
}
