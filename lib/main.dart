import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/page/myHome/myHome.dart';
import 'package:ulearning_app/page/sign_in/sign_in.dart';
import 'package:ulearning_app/page/welcome/bloc/welcome_blocs.dart';
import 'package:ulearning_app/page/welcome/welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          lazy: false,
          create: (context) => WelcomeBloc(),
        )
      ],
      child: ScreenUtilInit(
          builder: (context, child) => MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                    appBarTheme: const AppBarTheme(
                        elevation: 0, backgroundColor: Colors.white)),
                home: const WelcomeScreen(),
                routes: {
                  "myHomePage": (context) => const MyHomePage(),
                  "signIn": (context) => const SignIn()
                },
              )),
    );
  }
}
