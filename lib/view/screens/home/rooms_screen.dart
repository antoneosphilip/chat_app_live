import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:live_app/view/base/room/top_rooms/square_top_rooms_item.dart';
import 'package:live_app/view/screens/home/widget/banner_view.dart';
import 'package:live_app/view/screens/home/widget/countires_home.dart';
import 'package:live_app/view/screens/home/widget/room_grid_view.dart';
import 'package:live_app/view/screens/home/widget/room_list.dart';
import 'package:live_app/view/screens/home/widget/second_banner.dart';
import 'package:live_app/view/screens/home/widget/top_home.dart';

import '../../../controller/country_controller.dart';
import '../../../controller/home_controller.dart';
import '../../../controller/notification_controller.dart';
import '../../../controller/splash_controller.dart';
import '../../../controller/user_controller.dart';
import '../../../data/model/response/room_model.dart';
import '../../../util/app_constants.dart';
import '../../base/custom_image.dart';
import '../../base/room/room_list.dart';
import '../../base/room/room_list_item.dart';
import '../../base/room/top_rooms/top_three_container.dart';
import '../../widgets/arrow_btn.dart';
import '../../widgets/loading_idicator.dart';
import '../../widgets/paginated_list_widget.dart';
import '../countries/country_list.dart';
import '../rooms/room_list_screen.dart';

class RoomsScreen extends StatefulWidget {
  const RoomsScreen({super.key});

  static Future<void> loadData(bool reload) async {
    Get.find<HomeController>().getData();
  }

  @override
  State<RoomsScreen> createState() => _RoomsScreenState();
}

class _RoomsScreenState extends State<RoomsScreen> {
  final ScrollController _scrollController = ScrollController();
  bool isEndOfScreen = false;

  bool isLoading = false;
  int page = 1;
  List<RoomModel> roomList = [];
  List<RoomModel> topThree = [];

  @override
  void initState() {
    // RoomsScreen.loadData(false);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(builder: (splashController) {
      return Container(
        child: RefreshIndicator(onRefresh: () async {
          // splashController.setRefreshing(true);
          // await Get.find<UserController>().getUserInfo();
          // await Get.find<HomeController>().getData();
          // await Get.find<NotificationController>().getNotificationList(true);
          // splashController.setRefreshing(false);
        }, child: GetBuilder<HomeController>(builder: (homeController) {
          print("hasss more dataa ${homeController.hasMoreData}");

          return
              // homeController.isLoading
              //   ? const LoadingIndicator()
              Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
            ),
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  Center(
                    child: SizedBox(
                      width: Get.width,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 90.h,
                            ),
                            TopHome(
                              homeController: homeController,
                            ),
                            // Row(
                            //   mainAxisAlignment:
                            //       MainAxisAlignment.spaceEvenly,
                            //   children: [
                            //     CarouselViewWidget(
                            //       width: (MediaQuery.of(context)
                            //                   .size
                            //                   .width -
                            //               30) *
                            //           0.5,
                            //       height: MediaQuery.of(context)
                            //               .size
                            //               .height *
                            //           0.10,
                            //       imageIndexName: 'image',
                            //       baseUrl:
                            //           "${AppConstants.mediaUrl}/banner",
                            //       itemList: homeController.staticBannerImage,
                            //       onPageChanged: (int,
                            //           CarouselPageChangedReason) {},
                            //       onTap: (int index) {},
                            //       // scrollDirection: Axis.vertical,
                            //       // duration: 4,
                            //     ),
                            //     CarouselViewWidget(
                            //       width: (MediaQuery.of(context)
                            //                   .size
                            //                   .width -
                            //               30) *
                            //           0.5,
                            //       height: MediaQuery.of(context)
                            //               .size
                            //               .height *
                            //           0.10,
                            //       imageIndexName: 'image',
                            //       baseUrl:
                            //           "${AppConstants.mediaUrl}/banner",
                            //       itemList: homeController.staticBannerImage,
                            //       onPageChanged: (int,
                            //           CarouselPageChangedReason) {},
                            //       onTap: (int index) {},
                            //       // scrollDirection: Axis.vertical,
                            //       // duration: 2,
                            //     )
                            //   ],
                            // ),
                            TopThreeContainer(
                              homeController: homeController,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: GridView.builder(
                                shrinkWrap: true,
                                physics:
                                    NeverScrollableScrollPhysics(), // لو داخل ScrollView
                                padding: EdgeInsets.zero,
                                itemCount: homeController.staticRoomGrid.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, // عدد الأعمدة
                                  mainAxisSpacing:
                                      8.0, // المسافة العمودية بين العناصر
                                  crossAxisSpacing: 8.0,
                                  // المسافة الأفقية بين العناصر
                                  childAspectRatio: 1,
                                  // لأنك عايز العنصر يكون مربع (width == height)
                                ),
                                itemBuilder: (context, index) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: SquareTopRoomsItem(
                                          room: homeController
                                              .staticRoomGrid[index],
                                          no: '${index + 1}',
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Image(
                                            image: NetworkImage(
                                                'https://th.bing.com/th/id/OIP.4ve4zACsz1LZOlMcCUHGBAHaE8?rs=1&pid=ImgDetMain'),
                                            width: 12.w,
                                            height: 12.h,
                                          ),
                                          SizedBox(
                                            width: 4.w,
                                          ),
                                          Text(
                                            "وكالة",
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      )
                                    ],
                                  );
                                },
                              ),
                            ),

                            SecondBanner(
                              homeController: homeController,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              "الغرف المفضلة",
                              style: TextStyle(
                                  fontSize: 16.sp, fontWeight: FontWeight.bold),
                            ),
                            RoomGridView(
                              homeController: homeController,
                            ),
                            SizedBox(
                              height: 80.h,
                            ),
                            // CountriesHome(homeController: homeController,),
                            // RoomListView(homeController: homeController,),
                          ]),
                    ),
                  ),
                ],
              ),
            ),
          );
        })),
      );
    });
  }
}
