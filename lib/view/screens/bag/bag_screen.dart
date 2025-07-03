import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BagScreen extends StatefulWidget {
  const BagScreen({Key? key}) : super(key: key);

  @override
  State<BagScreen> createState() => _BagScreenState();
}

class _BagScreenState extends State<BagScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A1A1A),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Bag',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          Row(
            children: [
              Icon(Icons.store, color: Color(0xFFFFB800), size: 25.sp),
              const SizedBox(width: 4),
              const Text(
                'Store',
                style: TextStyle(
                  color: Color(0xFFFFB800),
                  fontSize: 16,
                ),
              ),
            ],
          ),
          SizedBox(width: 15.h),
        ],
      ),
      body: Column(
        children: [
          // Custom TabBar
          Container(
            color: const Color(0xFF1A1A1A),
            child: TabBar(
              controller: _tabController,
              isScrollable: true,
              indicatorColor: const Color(0xFF00D4AA),
              indicatorWeight: 2,
              labelColor: const Color(0xFF00D4AA),
              unselectedLabelColor: Colors.white70,
              labelStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              unselectedLabelStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
              tabs: const [
                Tab(text: 'Vehicle'),
                Tab(text: 'Avatar Frame'),
                Tab(text: 'Mic Wave'),
                Tab(text: 'Entrance Banner'),
                Tab(text: 'Bubble'),
                Tab(text: 'ID'),
              ],
            ),
          ),
          // TabBarView
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildNoDataTab(),
                _buildNoDataTab(),
                _buildNoDataTab(),
                _buildNoDataTab(),
                _buildNoDataTab(),
                _buildNoDataTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNoDataTab() {
    return Container(
      color: const Color(0xFF1A1A1A),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Empty box icon
            Container(
              width: 80,
              height: 60,
              decoration: BoxDecoration(
                color: const Color(0xFF2A2A2A),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Stack(
                children: [
                  // Box base
                  Positioned(
                    bottom: 0,
                    left: 15,
                    right: 15,
                    child: Container(
                      height: 35,
                      decoration: BoxDecoration(
                        color: const Color(0xFF404040),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                  // Box lid
                  Positioned(
                    top: 10,
                    left: 10,
                    right: 25,
                    child: Container(
                      height: 15,
                      decoration: BoxDecoration(
                        color: const Color(0xFF00D4AA).withOpacity(0.8),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'No Data',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
