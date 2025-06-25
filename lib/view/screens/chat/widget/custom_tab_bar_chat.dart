import 'package:flutter/material.dart';

class RealTabBarChatWidget extends StatefulWidget {
  final Function(int) onTabChanged;
  final int initialIndex;

  const RealTabBarChatWidget({
    Key? key,
    required this.onTabChanged,
    this.initialIndex = 0,
  }) : super(key: key);

  @override
  State<RealTabBarChatWidget> createState() => _RealTabBarChatWidgetState();
}

class _RealTabBarChatWidgetState extends State<RealTabBarChatWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<String> tabs = ['Message', 'Friend'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: tabs.length, vsync: this, initialIndex: widget.initialIndex);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging == false) {
        widget.onTabChanged(_tabController.index);
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        children: [
          // TabBar Section
          Expanded(
            child: TabBar(
              controller: _tabController,
              tabs: tabs.map((tab) => Tab(text: tab)).toList(),
              isScrollable: true,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.black.withOpacity(0.6),
              labelStyle:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              unselectedLabelStyle:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              indicator: const UnderlineTabIndicator(
                borderSide: BorderSide(width: 2, color: Colors.black),
                insets: EdgeInsets.symmetric(horizontal: 10), // Short underline
              ),
              indicatorSize: TabBarIndicatorSize.label, // To match text width
            ),
          ),

          // Search Icon
          GestureDetector(
            onTap: () {
              print("Search tapped");
            },
            child: const Icon(
              Icons.search,
              color: Colors.black,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
