import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyRoomsTabBar extends StatelessWidget {
  final TabController tabController;
  const MyRoomsTabBar({Key? key, required this.tabController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      labelPadding: EdgeInsets.zero,
      tabs: [
        Tab(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.r),
              image: const DecorationImage(
                image: AssetImage('assets/images/send_msg_bg.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: const AssetImage('assets/images/icon_recent.png'),
                  width: 30.w,
                ),
                SizedBox(width: 5.w),
                Text('Recently', style: TextStyle(fontSize: 15.sp)),
              ],
            ),
          ),
        ),
        Tab(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.r),
              image: const DecorationImage(
                image: AssetImage('assets/images/send_msg_bg.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: const AssetImage('assets/images/icon_hot.png'),
                  width: 30.w,
                ),
                SizedBox(width: 5.w),
                Text('New', style: TextStyle(fontSize: 15.sp)),
              ],
            ),
          ),
        ),
        Tab(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.r),
              image: const DecorationImage(
                image: AssetImage('assets/images/send_msg_bg.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: const AssetImage('assets/images/icon_favorite.png'),
                  width: 30.w,
                ),
                SizedBox(width: 5.w),
                Text('Favorite', style: TextStyle(fontSize: 15.sp)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
