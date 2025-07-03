import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VipBadgeSection extends StatelessWidget {
  const VipBadgeSection({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 170.w,
              height: 170.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.amber.shade400,
                boxShadow: [
                  BoxShadow(
                    color: Colors.yellow.withOpacity(0.7),
                    blurRadius: 60.r,
                    spreadRadius: 20.r,
                  ),
                ],
              ),
            ),
            Icon(Icons.pets, color: Colors.white, size: 100.w),
            Positioned(
              top: 32.w,
              child: Icon(Icons.emoji_events,
                  color: Colors.amber.shade900, size: 40.w),
            ),
          ],
        ),
        SizedBox(height: 18.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 6.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 8.r,
                offset: Offset(0, 2.h),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.lock, color: Colors.black, size: 18.w),
              SizedBox(width: 6.w),
              Text('Locked',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          'More privileges for upgrading VIP',
          style: TextStyle(color: Colors.white70, fontSize: 13.sp),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 16.h),
        Icon(Icons.emoji_events, color: Colors.amber, size: 48.w),
      ],
    );
  }
}
