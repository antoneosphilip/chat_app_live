import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActivityDetailsHeader extends StatelessWidget {
  final VoidCallback? onBack;
  const ActivityDetailsHeader({Key? key, this.onBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Row(
        children: [
          IconButton(
            onPressed: onBack ?? () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 24,
            ),
          ),
          const Expanded(
            child: Text(
              'Activity Details',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(width: 40),
        ],
      ),
    );
  }
}
