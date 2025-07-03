import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VipPrivilegesCount extends StatelessWidget {
  const VipPrivilegesCount({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.7),
          borderRadius: BorderRadius.circular(18.r),
          border: Border.all(color: Colors.white24, width: 1.2.w),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 8.r,
              offset: Offset(0, 2.h),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.emoji_events, color: Color(0xFFFFB800), size: 22.w),
            SizedBox(width: 8.w),
            Text('Privileges ',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500)),
            Text('25',
                style: TextStyle(
                    color: Color(0xFFFFB800),
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold)),
            Text('/25',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500)),
            SizedBox(width: 8.w),
            Icon(Icons.emoji_events, color: Colors.white24, size: 18.w),
          ],
        ),
      ),
    );
  }
}
