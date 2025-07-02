import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'widget/room_activities_header.dart';
import 'widget/room_activities_tabbar.dart';
import 'widget/room_activities_status_tabbar.dart';
import 'widget/room_activities_activities_list.dart';
import 'widget/room_activities_rewards_section.dart';

class RoomActivitiesScreen extends StatefulWidget {
  const RoomActivitiesScreen({Key? key}) : super(key: key);

  @override
  State<RoomActivitiesScreen> createState() => _RoomActivitiesScreenState();
}

class _RoomActivitiesScreenState extends State<RoomActivitiesScreen>
    with TickerProviderStateMixin {
  late TabController _mainTabController;
  late TabController _statusTabController;

  @override
  void initState() {
    super.initState();
    _mainTabController = TabController(length: 2, vsync: this);
    _statusTabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _mainTabController.dispose();
    _statusTabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ongoingActivities = [
      ActivityItem(
        title: 'وقاسيسيسيسيسيسيسيسيسيسة',
        subtitle: 'وقاسيسيسيسيسيسيسيسيسيسيسة',
        time: '06/26 22:56',
        participants: '5 people have joined',
        image: 'assets/concert_bg.jpg',
      ),
      ActivityItem(
        title: 'مع المنافسة تولين',
        subtitle: 'مع المنافسة تولين',
        time: '06/26 23:00',
        participants: '29 people have joined',
        image: 'assets/game_bg.jpg',
      ),
      ActivityItem(
        title: 'عيد ميلاد القمر',
        subtitle: 'عيد ميلاد القمر',
        time: '06/26 23:02',
        participants: '7 people have joined',
        image: 'assets/concert_bg.jpg',
      ),
    ];
    final upcomingActivities = [
      ActivityItem(
        title: 'Upcoming Event 1',
        subtitle: 'Description for upcoming event',
        time: '06/27 15:00',
        participants: '12 people registered',
        image: 'assets/concert_bg.jpg',
      ),
    ];
    final enrolledActivities = [
      ActivityItem(
        title: 'Enrolled Activity 1',
        subtitle: 'Your enrolled activity',
        time: '06/28 10:00',
        participants: 'You are enrolled',
        image: 'assets/game_bg.jpg',
      ),
    ];
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF9B59B6), Color(0xFF87CEEB)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const RoomActivitiesHeader(),
              RoomActivitiesTabBar(controller: _mainTabController),
              SizedBox(height: 20.h),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.r),
                      topRight: Radius.circular(25.r),
                    ),
                  ),
                  child: TabBarView(
                    controller: _mainTabController,
                    children: [
                      // Activity Square Tab
                      Column(
                        children: [
                          SizedBox(height: 10.h),
                          RoomActivitiesStatusTabBar(
                              controller: _statusTabController),
                          SizedBox(height: 10.h),
                          Expanded(
                            child: TabBarView(
                              controller: _statusTabController,
                              children: [
                                RoomActivitiesActivitiesList(
                                    activities: ongoingActivities),
                                RoomActivitiesActivitiesList(
                                    activities: upcomingActivities),
                                RoomActivitiesActivitiesList(
                                    activities: enrolledActivities),
                              ],
                            ),
                          ),
                        ],
                      ),
                      // Rewards Tab
                      const RoomActivitiesRewardsSection(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
