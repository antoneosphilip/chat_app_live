import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:live_app/view/screens/home/widget/top_home.dart';
import 'package:live_app/controller/home_controller.dart';

class ExploreTopSection extends StatelessWidget {
  final HomeController homeController;
  const ExploreTopSection({Key? key, required this.homeController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 100.h),
        TopHome(homeController: homeController),
        SizedBox(height: 20.h),
      ],
    );
  }
}
