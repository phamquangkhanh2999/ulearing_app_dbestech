import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/routes/pages.dart';
import 'package:ulearning_app/common/values/colors.dart';
import 'package:ulearning_app/page/application/application_page.dart';
import 'package:ulearning_app/page/bloc_providers.dart';
import 'package:ulearning_app/page/register/register.dart';
import 'package:ulearning_app/page/sign_in/bloc/signin_blocs.dart';
import 'package:ulearning_app/page/sign_in/sign_in.dart';
import 'package:ulearning_app/page/welcome/bloc/welcome_blocs.dart';
import 'package:ulearning_app/page/welcome/welcome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [...AppPages.allBlocProviders(context)],
      child: ScreenUtilInit(
          builder: (context, child) => MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                    appBarTheme: const AppBarTheme(
                        iconTheme: IconThemeData(color: AppColors.primaryText),
                        elevation: 0,
                        backgroundColor: Colors.white)),
                // initialRoute: "/",
                home: const WelcomeScreen(),
                onGenerateRoute: AppPages.GenerateRouterSettings,
                // routes: {
                //   "signIn": (context) => const SignIn(),
                //   "register": (context) => const Register()
                // },
              )),
    );
  }
}
