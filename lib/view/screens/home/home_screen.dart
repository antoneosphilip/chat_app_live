import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_app/controller/splash_controller.dart';
import 'package:live_app/view/screens/explore/explore_screen.dart';
import 'package:live_app/view/screens/home/mine_screen.dart';
import 'package:live_app/view/screens/home/my_rooms_screen.dart';
import 'package:live_app/view/screens/home/rooms_screen.dart';
import 'package:live_app/view/screens/home/widget/home_appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  TabController? _tabController;
  int selectedTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, initialIndex: 0, vsync: this);
  }

  void _onTabChanged(int index) {
    setState(() {
      selectedTabIndex = index;
    });
    _tabController?.animateTo(index);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(builder: (splashController) {
      return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white54,
        appBar: CustomAppBarWithTabs(
          tabBarwidget: CustomTabBarWidget(
            onTabChanged: _onTabChanged,
            initialIndex: selectedTabIndex,
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            // Tab 1: Hot (RoomsScreen)
            const RoomsScreen(),

            // Tab 2: Mine (MyRoomsScreen)
            MineScreen(),

            // Tab 3: Explore (يمكنك إنشاء شاشة جديدة أو استخدام شاشة موجودة)
            ExploreScreen(),
          ],
        ),
      );
    });
  }

  Widget _buildExploreScreen() {
    return Container(
      padding: EdgeInsets.only(top: 100.h),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
      ),
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.explore,
              size: 80,
              color: Colors.grey,
            ),
            SizedBox(height: 20),
            Text(
              'Explore Content',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Coming Soon...',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }
}

// Custom TabBar Widget
class CustomTabBarWidget extends StatefulWidget {
  final Function(int) onTabChanged;
  final int initialIndex;

  const CustomTabBarWidget({
    Key? key,
    required this.onTabChanged,
    this.initialIndex = 0,
  }) : super(key: key);

  @override
  State<CustomTabBarWidget> createState() => _CustomTabBarWidgetState();
}

class _CustomTabBarWidgetState extends State<CustomTabBarWidget> {
  int selectedIndex = 0;

  final List<String> tabs = ['Hot', 'Mine', 'Explore'];

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        children: [
          // TabBar Section
          Expanded(
            child: Row(
              children: tabs.asMap().entries.map((entry) {
                int index = entry.key;
                String tab = entry.value;
                bool isSelected = index == selectedIndex;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                    widget.onTabChanged(index);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 30),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          tab,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight:
                                isSelected ? FontWeight.bold : FontWeight.w500,
                            color: isSelected
                                ? Colors.black
                                : Colors.black.withOpacity(0.6),
                          ),
                        ),
                        const SizedBox(height: 5),
                        // Underline indicator
                        Container(
                          height: 2,
                          width: tab.length * 8.0,
                          decoration: BoxDecoration(
                            color:
                                isSelected ? Colors.black : Colors.transparent,
                            borderRadius: BorderRadius.circular(1),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),

          // Action Buttons Section
          Row(
            children: [
              // Search Button
              GestureDetector(
                onTap: () {
                  // Handle search action
                  print("Search tapped");
                },
                child: const Icon(
                  Icons.search,
                  color: Colors.black,
                  size: 30,
                ),
              ),
              const SizedBox(width: 15),

              // Add/Plus Button
              GestureDetector(
                onTap: () {
                  // Handle add/create room action
                  print("Add room tapped");
                },
                child: const Icon(
                  Icons.home,
                  color: Colors.black,
                  size: 30,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Custom AppBar with Tabs
class CustomAppBarWithTabs extends StatelessWidget
    implements PreferredSizeWidget {
  final Widget tabBarwidget;
  final double? height;

  const CustomAppBarWithTabs({
    Key? key,
    required this.tabBarwidget,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFFF6B6B), // Light red/pink
            Color(0xFFFFB347), // Orange
            Color(0xFFFF69B4), // Hot pink
          ],
        ),
      ),
      child: SafeArea(
        child: tabBarwidget,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? 100);
}
