import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:live_app/controller/home_controller.dart';

import '../../../controller/room_controller.dart';
import '../../../controller/user_controller.dart';
import '../../base/room/room_list_item.dart';
import '../../widgets/paginated_list_widget.dart';
import '../rooms/create_room_screen.dart';
import 'widget/my_rooms_top_section.dart';
import 'widget/my_rooms_tabbar.dart';

class MyRoomsScreen extends StatefulWidget {
  const MyRoomsScreen({Key? key}) : super(key: key);

  @override
  State<MyRoomsScreen> createState() => _MyRoomsScreenState();
}

class _MyRoomsScreenState extends State<MyRoomsScreen>
    with TickerProviderStateMixin {
  final ScrollController _recentScrollController = ScrollController();
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: Column(
        children: [
          const MyRoomsTopSection(),
          SizedBox(height: 10.h),
          MyRoomsTabBar(tabController: tabController),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GetBuilder<HomeController>(
                    builder: (HomeController homeController) {
                      return PaginatedListWidget(
                          scrollController: _recentScrollController,
                          page: homeController.page,
                          isLoading: homeController.isLoading,
                          enabledPagination: true,
                          onPaginate: (int? page) {
                            homeController.paginate(homeController.page + 1);
                          },
                          itemView: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              children: [
                                ...?homeController.homeRooms?.map(
                                  (e) => SizedBox(
                                    height: 100,
                                    child: RoomListItem(
                                      room: e,
                                      userModel:
                                          Get.find<UserController>().userModel!,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ));
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GetBuilder<HomeController>(
                    builder: (HomeController homeController) {
                      return PaginatedListWidget(
                        scrollController: _recentScrollController,
                        page: homeController.page,
                        isLoading: homeController.isLoading,
                        enabledPagination: true,
                        onPaginate: (int? page) {
                          homeController.paginate(homeController.page + 1);
                        },
                        itemView: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            children: [
                              ...?homeController.homeRooms?.map(
                                (e) => Container(
                                  height: 100,
                                  child: RoomListItem(
                                    room: e,
                                    userModel:
                                        Get.find<UserController>().userModel!,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GetBuilder<HomeController>(
                    builder: (HomeController homeController) {
                      return PaginatedListWidget(
                        scrollController: _recentScrollController,
                        page: homeController.page,
                        isLoading: homeController.isLoading,
                        enabledPagination: true,
                        onPaginate: (int? page) {
                          homeController.paginate(homeController.page + 1);
                        },
                        itemView: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            children: [
                              ...?homeController.homeRooms?.map(
                                (e) => Container(
                                  height: 100,
                                  child: RoomListItem(
                                    room: e,
                                    userModel:
                                        Get.find<UserController>().userModel!,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
