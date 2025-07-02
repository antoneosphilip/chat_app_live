import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActivityDetailsImageCard extends StatelessWidget {
  const ActivityDetailsImageCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      height: 200.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        image: const DecorationImage(
          image: NetworkImage(
            'https://images.unsplash.com/photo-1551993005-75c4131b6bd8?w=400&h=200&fit=crop',
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
