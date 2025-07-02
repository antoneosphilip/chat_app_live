import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventsCenterAppBar extends StatelessWidget {
  final VoidCallback? onBack;
  const EventsCenterAppBar({Key? key, this.onBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120.h,
      child: SafeArea(
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white, size: 26.w),
                  onPressed: onBack ?? () => Navigator.pop(context),
                ),
              ),
              Center(
                child: Text(
                  'Events Center',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
