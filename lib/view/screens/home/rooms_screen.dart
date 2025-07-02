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
import 'package:live_app/view/screens/home/widget/rooms_top_section.dart';
import 'package:live_app/view/screens/home/widget/rooms_grid_section.dart';

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

class RoomsScreen extends StatelessWidget {
  const RoomsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(builder: (splashController) {
      return GetBuilder<HomeController>(builder: (homeController) {
        return Container(
          color: Theme.of(context).cardColor,
          child: SingleChildScrollView(
            child: Column(
              children: [
                RoomsTopSection(homeController: homeController),
                RoomsGridSection(homeController: homeController),
              ],
            ),
          ),
        );
      });
    });
  }
}
