import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/values/colors.dart';
import 'package:ulearning_app/page/application/widgets/widget_application.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            body: buildPage(_index),
            bottomNavigationBar: Container(
              width: 375.w,
              height: 58.h,
              decoration: BoxDecoration(
                  color: AppColors.primaryElement,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24.w),
                    topRight: Radius.circular(24.w),
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 1)
                  ]),
              child: BottomNavigationBar(
                  currentIndex: _index,
                  onTap: (value) {
                    setState(() {
                      _index = value;
                    });
                  },
                  elevation: 0,
                  type: BottomNavigationBarType.fixed,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  selectedItemColor: AppColors.primaryElement,
                  unselectedItemColor: AppColors.primaryFourElementText,
                  items: [
                    buildBottomNavigation("home", "home.png"),
                    buildBottomNavigation("search", "search.png"),
                    buildBottomNavigation("play", "play-circle1.png"),
                    buildBottomNavigation("chat", "message-circle.png"),
                    buildBottomNavigation("profile", "person2.png"),
                  ]),
            ),
          ),
        ));
  }
}
