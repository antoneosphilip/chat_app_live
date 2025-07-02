import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'widget/my_room_card.dart';
import 'widget/liked_empty_state.dart';
import 'widget/recently_screen.dart';

class MineScreen extends StatefulWidget {
  const MineScreen({Key? key}) : super(key: key);

  @override
  _MineScreenState createState() => _MineScreenState();
}

class _MineScreenState extends State<MineScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          SizedBox(height: 100.h),
          const MyRoomCard(),
          SizedBox(height: 8.h),
          TabBar(
            controller: _tabController,
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(width: 2, color: Colors.teal),
              insets: EdgeInsets.symmetric(horizontal: 80.w),
            ),
            labelColor: Colors.teal,
            unselectedLabelColor: Colors.grey[600],
            labelStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
            unselectedLabelStyle:
                TextStyle(fontSize: 16.sp, fontWeight: FontWeight.normal),
            tabs: const [
              Tab(text: 'Liked'),
              Tab(text: 'Recently'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                LikedEmptyState(),
                RecentlyScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
