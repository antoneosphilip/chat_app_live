import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LikedEmptyState extends StatelessWidget {
  const LikedEmptyState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(32.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 120.w,
            height: 120.w,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 20.w,
                  left: 15.w,
                  child: Container(
                    width: 30.w,
                    height: 40.w,
                    decoration: BoxDecoration(
                      color: Colors.teal[200],
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                  ),
                ),
                Positioned(
                  top: 35.w,
                  left: 50.w,
                  child: Container(
                    width: 25.w,
                    height: 35.w,
                    decoration: BoxDecoration(
                      color: Colors.green[300],
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20.w,
                  left: 20.w,
                  right: 20.w,
                  child: Container(
                    height: 8.w,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24.h),
          Text(
            'Go to follow some of the rooms and find your joy!',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14.sp,
            ),
          ),
        ],
      ),
    );
  }
}
