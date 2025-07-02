import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:live_app/controller/home_controller.dart';
import 'package:live_app/view/screens/explore/activity_details_sreen.dart';
import 'package:live_app/view/screens/explore/event_screen.dart';
import 'package:live_app/view/screens/explore/pk_arena_screen.dart';
import 'package:live_app/view/screens/explore/room_avtivites_screen.dart';
import 'package:live_app/view/screens/home/widget/top_home.dart';
import 'package:live_app/view/screens/explore/widget/action_button_widget.dart';
import 'package:live_app/view/screens/explore/widget/activity_card_widget.dart';
import 'package:live_app/view/screens/explore/widget/new_flag_card_widget.dart';
import 'package:live_app/view/screens/explore/widget/explore_top_section.dart';
import 'package:live_app/view/screens/explore/widget/explore_action_buttons.dart';
import 'package:live_app/view/screens/explore/widget/explore_sada_official.dart';
import 'package:live_app/view/screens/explore/widget/explore_room_activities.dart';
import 'package:live_app/view/screens/explore/widget/explore_activity_cards_list.dart';
import 'package:live_app/view/screens/explore/widget/explore_events_honor_list.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (homeController) {
        return Scaffold(
          backgroundColor: const Color(0xFFF5F5F5),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ExploreTopSection(homeController: homeController),
                ExploreActionButtons(
                  onEvents: () => Get.to(() => EventsCenterScreen()),
                  onPK: () => Get.to(() => PKArenaScreen()),
                  onInterviews: () {},
                ),
                SizedBox(height: 25.h),
                const ExploreSadaOfficial(),
                SizedBox(height: 25.h),
                ExploreRoomActivities(
                  onMore: () => Get.to(() => RoomActivitiesScreen()),
                ),
                const ExploreActivityCardsList(
                  cards: [
                    ActivityCardWidget(title: 'سوالف', time: '06/26 18:12'),
                    ActivityCardWidget(title: 'هاي', time: '06/26 18:15'),
                    ActivityCardWidget(title: 'مرحبا', time: '06/26 18:18'),
                  ],
                ),
                SizedBox(height: 25.h),
                const ExploreEventsHonorList(),
                SizedBox(height: 30.h),
              ],
            ),
          ),
        );
      },
    );
  }
}
