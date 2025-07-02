import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PKArenaRankings extends StatelessWidget {
  const PKArenaRankings({Key? key}) : super(key: key);

  Widget _buildPodiumItem(int position, Color color, String number,
      {bool isFirst = false}) {
    return Column(
      children: [
        Container(
          width: isFirst ? 44.w : 36.w,
          height: isFirst ? 44.w : 36.w,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            border: Border.all(
              color: isFirst ? Colors.amber : Colors.white,
              width: 2.w,
            ),
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.5),
                blurRadius: 8.r,
              ),
            ],
          ),
          child: Center(
            child: Text(
              number,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: isFirst ? 20.sp : 16.sp,
              ),
            ),
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          position == 1
              ? '1st'
              : position == 2
                  ? '2nd'
                  : '3rd',
          style: TextStyle(
            color: Colors.white,
            fontSize: 10.sp,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFB24536),
            Color(0xFFF8B500),
            Color(0xFF3CA55C),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8.r,
            offset: Offset(0, 4.h),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Rankings',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildPodiumItem(2, Color(0xFF4A90E2), '2'),
                    _buildPodiumItem(1, Color(0xFFFFD700), '1', isFirst: true),
                    _buildPodiumItem(3, Color(0xFFCD7F32), '3'),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(color: Colors.amber, width: 2.w),
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.green,
                    radius: 20.w,
                    child: Text(
                      'A',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    'Antoneos...',
                    style: TextStyle(
                      color: Colors.amber,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    '✖ 0',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.sp,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('0',
                          style:
                              TextStyle(color: Colors.white, fontSize: 12.sp)),
                      Icon(Icons.flash_on, color: Colors.amber, size: 16.w),
                      Text('0',
                          style:
                              TextStyle(color: Colors.white, fontSize: 12.sp)),
                    ],
                  ),
                  SizedBox(height: 2.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('0',
                          style:
                              TextStyle(color: Colors.white, fontSize: 10.sp)),
                      Text('Victory',
                          style:
                              TextStyle(color: Colors.amber, fontSize: 10.sp)),
                      Text('0',
                          style:
                              TextStyle(color: Colors.white, fontSize: 10.sp)),
                    ],
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    'Defeat',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 10.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
