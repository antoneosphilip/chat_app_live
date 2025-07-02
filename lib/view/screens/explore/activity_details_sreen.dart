import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:live_app/view/screens/explore/widget/activity_details_header.dart';
import 'package:live_app/view/screens/explore/widget/activity_details_image_card.dart';
import 'package:live_app/view/screens/explore/widget/activity_details_info_card.dart';

class ActivityDetailsScreen extends StatelessWidget {
  const ActivityDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF8F5CFF),
                  Color(0xFF6FE7FF),
                  Colors.white,
                ],
                stops: [0.0, 0.35, 1.0],
              ),
            ),
          ),
          const SafeArea(
            child: Column(
              children: [
                ActivityDetailsHeader(),
                ActivityDetailsImageCard(),
                SizedBox(height: 20),
                ActivityDetailsInfoCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
