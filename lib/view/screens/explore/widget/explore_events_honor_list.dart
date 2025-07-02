import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:live_app/view/screens/explore/widget/new_flag_card_widget.dart';

class ExploreEventsHonorList extends StatelessWidget {
  const ExploreEventsHonorList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            'Events & Honor',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
        SizedBox(height: 15.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 3,
            itemBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.only(bottom: 10.0),
                child: NewFlagCardWidget(),
              );
            },
          ),
        ),
      ],
    );
  }
}
