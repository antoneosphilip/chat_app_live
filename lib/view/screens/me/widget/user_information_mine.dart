import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:live_app/controller/user_controller.dart';

import '../../../../controller/reltionship_controller.dart';
import '../../users/followers_screen.dart';
import '../../users/followings_screen.dart';
import '../../users/friends_screen.dart';
import '../../users/visitors_screen.dart';

class UserInformationMine extends StatelessWidget {
  final UserController userController;
  const UserInformationMine({super.key, required this.userController});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          onTap: () {
            Get.find<RelationshipController>().getFriendList();
            Get.to(() => const FriendsScreen());
          },
          child: Column(
            children: [
              Text('${userController.userModelStatic?.friendsCount}'),
              Text(
                'friends'.tr,
                style: TextStyle(color: Colors.black38, fontSize: 14.sp),
              ),
            ],
          ),
        ),
        InkWell(
          onTap: () {
            Get.find<RelationshipController>().getFollowingsList();
            Get.to(() => FollowingsScreen());
          },
          child: Column(
            children: [
              Text('${userController.userModelStatic?.followingsCount}'),
              Text(
                'followings'.tr,
                style: TextStyle(color: Colors.black38, fontSize: 14.sp),
              ),
            ],
          ),
        ),
        InkWell(
          onTap: () {
            Get.find<RelationshipController>().getFollowersList();
            Get.to(() => FollowersScreen());
          },
          child: Column(
            children: [
              Text('${userController.userModelStatic?.followersCount}'),
              Text(
                'followers'.tr,
                style: TextStyle(color: Colors.black38, fontSize: 14.sp),
              ),
            ],
          ),
        ),
        InkWell(
          onTap: () {
            Get.find<RelationshipController>().getVisitorsList();
            Get.to(() => VisitorsScreen());
          },
          child: Column(
            children: [
              Text('${userController.userModelStatic?.visitorsCount}'),
              Text(
                'visitors'.tr,
                style: TextStyle(color: Colors.black38, fontSize: 14.sp),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
