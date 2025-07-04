import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TaskCommunityScreen extends StatefulWidget {
  const TaskCommunityScreen({Key? key}) : super(key: key);

  @override
  State<TaskCommunityScreen> createState() => _TaskCommunityScreenState();
}

class _TaskCommunityScreenState extends State<TaskCommunityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFB39DDB), // موف أعلى يسار
              Color(0xFF6EC6F9), // أزرق سماوي
              Color(0xFFF5F5F5), // رمادي فاتح
            ],
            stops: [0.0, 0.16, 0.7],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header
              _buildHeader(),

              // Consecutive check-ins section
              _buildConsecutiveCheckIns(),

              // Reward cards grid
              _buildRewardCards(),

              // Tasks section
              Expanded(
                child: _buildTasksList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 20,
            ),
          ),
          const Expanded(
            child: Text(
              'Task Community',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: const Color(0xFFFFD700),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.card_giftcard,
              color: Colors.white,
              size: 18,
            ),
          ),
          const SizedBox(width: 8),
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(
              Icons.help_outline,
              color: Colors.white,
              size: 18,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildConsecutiveCheckIns() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                'Consecutive check-ins: ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFD700),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  '0',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildRewardCards() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          // First row of cards
          Row(
            children: [
              Expanded(child: _buildRewardCard()),
              const SizedBox(width: 8),
              Expanded(child: _buildRewardCard()),
              const SizedBox(width: 8),
              Expanded(child: _buildRewardCard()),
            ],
          ),
          const SizedBox(height: 8),
          // Second row of cards
          Row(
            children: [
              Expanded(child: _buildRewardCard()),
              const SizedBox(width: 8),
              Expanded(child: _buildRewardCard()),
              const SizedBox(width: 8),
              Expanded(child: _buildRewardCard()),
            ],
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildRewardCard() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      child: Container(
        height: 130,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFFFF3E0), // Light orange
              Color(0xFFFFE0B2), // Orange
            ],
          ),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: const Color(0xFFFFB74D),
            width: 2,
          ),
        ),
        child: Stack(
          children: [
            // Decorative border pattern
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: const Color(0xFFFF8A65),
                  width: 1,
                ),
              ),
              margin: const EdgeInsets.all(4),
            ),
            // Center content
            Center(
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFD700),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: const Color(0xFFFF8A65),
                    width: 2,
                  ),
                ),
                child: const Icon(
                  Icons.help_outline,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTasksList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Get rewards for doing tasks',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: [
              _buildTaskItem(
                type: "Daily",
                icon: Icons.message,
                title: "Send 10 messages in rooms",
                rewardIcon: Icons.emoji_events,
                rewardText: "x1",
                status: "unfinished",
                progress: "(0/2)",
              ),
              _buildTaskItem(
                type: "Recharge",
                icon: Icons.attach_money,
                title: "Recharge \$5",
                rewardIcon: Icons.emoji_events,
                rewardText: "x1",
                status: "unfinished",
                progress: "(0/3)",
              ),
              _buildTaskItem(
                type: "Spend",
                icon: Icons.gif,
                title: "Spend 10,000 coins for gift sending",
                rewardIcon: Icons.emoji_events,
                rewardText: "x1",
                status: "unfinished",
                progress: "(0/2)",
              ),
              _buildTaskItem(
                type: "Receive",
                icon: Icons.gif,
                title: "Receive 50,000 coins in gift sending",
                rewardIcon: Icons.emoji_events,
                rewardText: "x1",
                status: "unfinished",
                progress: "(0/2)",
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTaskItem({
    required String type,
    required IconData icon,
    required String title,
    required IconData rewardIcon,
    required String rewardText,
    required String status,
    required String progress,
  }) {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 6, horizontal: 0),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              // أيقونة المهمة مع النوع
              Column(
                children: [
                  // نوع المهمة

                  SizedBox(height: 8),
                  // أيقونة المهمة
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: Color(0xFF1DE9B6).withOpacity(0.15),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Icon(
                        icon,
                        color: Color(0xFF00BFAE),
                        size: 24,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 16),
              // العنوان والمكافأة
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // العنوان
                    Text(
                      title,
                      style: TextStyle(
                        color: Color(0xFF222222),
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 12),
                    // المكافأة
                    Row(
                      children: [
                        Icon(
                          rewardIcon,
                          color: Colors.amber,
                          size: 20,
                        ),
                        SizedBox(width: 6),
                        Text(
                          rewardText,
                          style: TextStyle(
                            color: Color(0xFF666666),
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // الحالة والتقدم
              Column(
                children: [
                  // حالة المهمة
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Color(0xFF1DE9B6),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      status,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  // التقدم
                  Center(
                    child: Text(
                      progress,
                      style: TextStyle(
                        color: Color(0xFF999999),
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Color(0xFFB2F0FF),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(16),
              ),
            ),
            child: Text(
              type,
              style: TextStyle(
                color: Color(0xFF00BFAE),
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildDailyTag() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.hourglass_empty,
          color: Color(0xFF00B2FF), // أزرق فاتح
          size: 20,
        ),
        SizedBox(width: 4),
        Text(
          "Daily",
          style: TextStyle(
            color: Color(0xFF00B2FF), // نفس لون الأيقونة
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}
