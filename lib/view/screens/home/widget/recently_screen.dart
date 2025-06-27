import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:live_app/controller/home_controller.dart';
import 'package:live_app/view/screens/home/widget/room_grid_view.dart';

class RecentlyScreen extends StatelessWidget {
  const RecentlyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeController) {
      return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding:
                EdgeInsets.only(bottom: 80.h, top: 20.h, right: 8.w, left: 8.w),
            child: RoomGridView(homeController: homeController),
          ));
    });
  }
}
