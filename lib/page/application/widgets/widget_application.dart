import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/values/colors.dart';

Widget buildPage(int index) {
  List<Widget> _widget = [
    const Center(
      child: Text("Home"),
    ),
    const Center(
      child: Text("Search"),
    ),
    const Center(
      child: Text("Course"),
    ),
    const Center(
      child: Text("Chat"),
    ),
    const Center(
      child: Text("Profile"),
    ),
  ];

  return _widget[index];
}

BottomNavigationBarItem buildBottomNavigation(String label, String image) {
  return BottomNavigationBarItem(
      label: label,
      icon: SizedBox(
        width: 15.w,
        height: 15.h,
        child: Image.asset("assets/icons/$image"),
      ),
      activeIcon: SizedBox(
        width: 15.w,
        height: 15.h,
        child: Image.asset(
          "assets/icons/$image",
          color: AppColors.primaryElement,
        ),
      ));
}
