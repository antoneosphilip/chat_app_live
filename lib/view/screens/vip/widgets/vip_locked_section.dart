import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VipLockedSection extends StatelessWidget {
  const VipLockedSection({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     Icon(Icons.lock, color: Colors.white, size: 20.w),
        //     SizedBox(width: 6.w),
        //     Text('Locked',
        //         style: TextStyle(color: Colors.white, fontSize: 16.sp)),
        //   ],
        // ),
        // SizedBox(height: 4.h),
        // Text('More privileges for upgrading VIP',
        //     style: TextStyle(color: Colors.white70, fontSize: 13.sp)),
      ],
    );
  }
}
