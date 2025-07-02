import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActionButtonWidget extends StatelessWidget {
  final String title;
  final Color color;
  final IconData icon;
  final VoidCallback? onTap;

  const ActionButtonWidget({
    Key? key,
    required this.title,
    required this.color,
    required this.icon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 52.h,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 10.w),
            Icon(
              icon,
              color: Colors.white,
              size: 28.sp,
            ),
            const Spacer(),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 14.sp,
              ),
            ),
            SizedBox(width: 10.w),
          ],
        ),
      ),
    );
  }
}
