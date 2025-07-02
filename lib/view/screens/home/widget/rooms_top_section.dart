import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:live_app/view/screens/home/widget/top_home.dart';
import 'package:live_app/view/base/room/top_rooms/top_three_container.dart';
import 'package:live_app/controller/home_controller.dart';

class RoomsTopSection extends StatelessWidget {
  final dynamic homeController;
  const RoomsTopSection({Key? key, required this.homeController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 90.h),
        TopHome(homeController: homeController),
        TopThreeContainer(homeController: homeController),
      ],
    );
  }
}
