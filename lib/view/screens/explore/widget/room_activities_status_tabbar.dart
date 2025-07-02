import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoomActivitiesStatusTabBar extends StatelessWidget {
  final TabController controller;
  const RoomActivitiesStatusTabBar({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.only(right: 16.w, top: 8.h, bottom: 8.h),
        padding: EdgeInsets.symmetric(horizontal: 0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25.r),
        ),
        child: SizedBox(
          width: 290.w,
          child: TabBar(
            controller: controller,
            indicator: BoxDecoration(
              color: const Color(0xFF00BCD4),
              borderRadius: BorderRadius.circular(25.r),
            ),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey[600],
            labelStyle: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
            tabs: const [
              Tab(text: 'Ongoing'),
              Tab(text: 'Upcoming'),
              Tab(text: 'Enrolled'),
            ],
          ),
        ),
      ),
    );
  }
}
