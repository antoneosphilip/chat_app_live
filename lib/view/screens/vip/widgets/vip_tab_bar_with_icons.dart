import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VipTabBarWithIcons extends StatelessWidget {
  final int selected;
  const VipTabBarWithIcons({this.selected = 0, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final List<String> vips = [
      'VIP7',
      'VIP6',
      'VIP5',
      'VIP4',
      'VIP3',
      'VIP2',
      'VIP1'
    ];
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back_ios_new_rounded,
                color: Colors.white, size: 22.w),
            onPressed: () => Navigator.of(context).pop(),
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                vips.length,
                (i) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        vips[i],
                        style: TextStyle(
                          color: i == selected
                              ? Color(0xFFFFB800)
                              : Color(0xFFE0E0E0),
                          fontWeight: i == selected
                              ? FontWeight.bold
                              : FontWeight.normal,
                          fontSize: 14.sp,
                          letterSpacing: 0.2,
                        ),
                      ),
                      SizedBox(height: 2.h),
                      AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        curve: Curves.ease,
                        width: i == selected ? 18.w : 0,
                        height: i == selected ? 4.h : 0,
                        decoration: BoxDecoration(
                          color: i == selected
                              ? Color(0xFFFFB800)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(2.r),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.help_outline, color: Colors.white, size: 22.w),
            onPressed: () {},
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(),
          ),
        ],
      ),
    );
  }
} 