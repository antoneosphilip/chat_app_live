import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:live_app/controller/room_controller.dart';
import 'package:live_app/controller/user_controller.dart';
import 'package:live_app/view/base/room/room_list_item.dart';
import 'package:live_app/view/screens/rooms/create_room_screen.dart';


class MyRoomsTopSection extends StatelessWidget {
  const MyRoomsTopSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userController = Get.find<UserController>();
    final roomController = Get.find<RoomController>();
    return Column(
      children: [
        SizedBox(height: 90.h),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.15,
          child: userController.userModel?.ownRoom == null
              ? InkWell(
                  onTap: () {
                    if (userController.userModel?.ownRoom != null) {
                      roomController
                          .joinRoom(userController.userModel!.ownRoom!);
                    } else {
                      Get.to(() => const CreateRoomScreen());
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      image: const DecorationImage(
                        matchTextDirection: true,
                        image: AssetImage(
                            'assets/images/create_room_button_bg.webp'),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 50.w,
                          height: 50.w,
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(100.r),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.add,
                              color: Colors.white70,
                              size: 30,
                            ),
                          ),
                        ),
                        SizedBox(width: 20.w),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'create room'.tr,
                              style: TextStyle(
                                  fontSize: 18.sp, color: Colors.white70),
                            ),
                            Text(
                              'create your own room'.tr,
                              style: TextStyle(
                                  fontSize: 15.sp, color: Colors.white70),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              : RoomListItem(
                  uuid: "${userController.userModel!.uuid}",
                  room: userController.userModel!.ownRoom!,
                  userModel: userController.userModel!,
                ),
        ),
      ],
    );
  }
}
