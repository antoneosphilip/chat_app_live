import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoomActivitiesTabBar extends StatelessWidget {
  final TabController controller;
  const RoomActivitiesTabBar({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: controller,
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(width: 2.5.w, color: Colors.white),
        insets: EdgeInsets.symmetric(horizontal: 85.w),
      ),
      labelColor: Colors.white,
      unselectedLabelColor: Colors.white70,
      labelStyle: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
      ),
      tabs: const [
        Tab(text: 'Activity Square'),
        Tab(text: 'Rewards'),
      ],
    );
  }
}
