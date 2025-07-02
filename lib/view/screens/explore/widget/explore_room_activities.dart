import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExploreRoomActivities extends StatelessWidget {
  final VoidCallback? onMore;
  const ExploreRoomActivities({Key? key, this.onMore}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Room Activities',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          InkWell(
            onTap: onMore,
            child: Row(
              children: [
                Text(
                  'More',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.black54,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 14.w,
                  color: Colors.black54,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
