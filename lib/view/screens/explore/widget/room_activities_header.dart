import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoomActivitiesHeader extends StatelessWidget {
  final VoidCallback? onBack;
  const RoomActivitiesHeader({Key? key, this.onBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: onBack ?? () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back, color: Colors.white),
          ),
          Expanded(
            child: Text(
              'Room Activities',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Stack(
              clipBehavior: Clip.none,
              children: [
                Icon(
                  Icons.celebration,
                  color: Colors.orange,
                  size: 40.w,
                ),
                Positioned(
                  right: -4.w,
                  bottom: -8.h,
                  child: Container(
                    width: 20.w,
                    height: 20.w,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1DE9B6),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 17.w,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 16.w),
        ],
      ),
    );
  }
}
