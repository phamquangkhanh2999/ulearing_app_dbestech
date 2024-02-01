import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/page/welcome/bloc/welcome_blocs.dart';
import 'package:ulearning_app/page/welcome/bloc/welcome_events.dart';
import 'package:ulearning_app/page/welcome/bloc/welcome_states.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        body: BlocBuilder<WelcomeBloc, WelcomeState>(
          builder: (context, state) {
            return Container(
              margin: EdgeInsets.only(top: 34.h),
              width: 375.w,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  PageView(
                    controller: pageController,
                    onPageChanged: (index) {
                      print("index ${index}");
                      state.page = index;
                      BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvent());
                    },
                    children: [
                      _page(
                          1,
                          context,
                          "next",
                          "First see Learning",
                          "Forget about a for of paper all knowledge in one learning!",
                          "assets/images/reading.png"),
                      _page(
                          2,
                          context,
                          "next",
                          "Connect With Everyone",
                          "Always keep in touch with your tutor & friend.",
                          "assets/images/boy.png"),
                      _page(
                          3,
                          context,
                          "get started",
                          "Always Fascinated Learning",
                          "Alywhere, anytime.The time is at our discretion so study whenever you want",
                          "assets/images/man.png")
                    ],
                  ),
                  Positioned(
                      bottom: 90.h,
                      child: DotsIndicator(
                        position: state.page,
                        dotsCount: 3,
                        mainAxisAlignment: MainAxisAlignment.center,
                        decorator: DotsDecorator(
                            color: Colors.grey,
                            activeColor: Colors.blue,
                            size: const Size.square(8.0),
                            activeShape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                      ))
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _page(int index, BuildContext context, String buttonName, String title,
      String subTile, String imagePath) {
    return Column(
      children: [
        SizedBox(width: 345.w, height: 345.w, child: Image.asset(imagePath)),
        Container(
          child: Text(
            title,
            style: TextStyle(
                color: Colors.black,
                fontSize: 24.sp,
                fontWeight: FontWeight.normal),
          ),
        ),
        Container(
          width: 375.w,
          height: 40.h,
          padding: EdgeInsets.only(left: 30.w, right: 30.w),
          child: Text(
            subTile,
            style: TextStyle(
                color: Colors.black.withOpacity(0.5),
                fontSize: 14.sp,
                fontWeight: FontWeight.normal),
          ),
        ),
        GestureDetector(
          onTap: () {
            if (index < 3) {
              pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.decelerate);
            } else {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil("signIn", (route) => false);
            }
          },
          child: Container(
            margin: EdgeInsets.only(top: 100.h, left: 25.w, right: 25.w),
            width: 325.w,
            height: 50.h,
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(15.w)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 10,
                      blurRadius: 20,
                      offset: const Offset(0, 1))
                ]),
            child: Center(
              child: Text(
                buttonName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.normal),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
