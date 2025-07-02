import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PKArenaBattlefield extends StatelessWidget {
  const PKArenaBattlefield({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    gradient:
                        LinearGradient(colors: [Colors.purple, Colors.pink]),
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  child: Text(
                    'PK',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.sp,
                    ),
                  ),
                ),
                SizedBox(width: 8.w),
                Text(
                  'PK Battlefield',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'More',
                  style: TextStyle(
                    color: Colors.cyan,
                    fontSize: 14.sp,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.cyan,
                  size: 16.w,
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 24.h),
        Container(
          height: 120.h,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF2D1B69), Color(0xFF11998E)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: Colors.amber, width: 2.w),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 12.w,
                top: 18.h,
                child: Icon(Icons.pets, color: Colors.redAccent, size: 48.w),
              ),
              Positioned(
                right: 12.w,
                top: 18.h,
                child: Icon(Icons.pets, color: Colors.blueAccent, size: 48.w),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.shield, color: Colors.white, size: 32.w),
                    SizedBox(height: 8.h),
                    Text(
                      'No one is on PK for the moment, you\ncan click the button below to start a PK!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
