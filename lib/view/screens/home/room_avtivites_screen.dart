import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoomActivitiesScreen extends StatefulWidget {
  @override
  _RoomActivitiesScreenState createState() => _RoomActivitiesScreenState();
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
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF8B5CF6),
              Color(0xFFEC4899),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header with back button and title
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                  ),
                  Expanded(
                    child: Text(
                      'Room Activities',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.add, color: Colors.white),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Main TabBar (Activity Square / Rewards)
              Container(
                child: TabBar(
                  controller: _mainTabController,
                  indicator: UnderlineTabIndicator(
                    borderSide:
                        const BorderSide(width: 2.5, color: Colors.white),
                    insets: EdgeInsets.symmetric(horizontal: 85.0.w),
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.white70,
                  labelStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  tabs: const [
                    Tab(text: 'Activity Square'),
                    Tab(text: 'Rewards'),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Content Area
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  child: TabBarView(
                    controller: _mainTabController,
                    children: [
                      // Activity Square Tab Content
                      Column(
                        children: [
                          // Status TabBar (Ongoing, Upcoming, Enrolled)
                          SizedBox(height: 10.h),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              margin: const EdgeInsets.only(
                                  right: 16, top: 8, bottom: 8),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: SizedBox(
                                width: 290.w,
                                child: TabBar(
                                  controller: _statusTabController,
                                  indicator: BoxDecoration(
                                    color: const Color(0xFF00BCD4),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  labelColor: Colors.white,
                                  unselectedLabelColor: Colors.grey[600],
                                  labelStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  tabs: const [
                                    Tab(text: 'Ongoing'),
                                    Tab(text: 'Upcoming'),
                                    Tab(text: 'Enrolled'),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10.h),
                          // Status TabBar Content
                          Expanded(
                            child: TabBarView(
                              controller: _statusTabController,
                              children: [
                                // Ongoing Activities
                                _buildActivitiesList([
                                  ActivityItem(
                                    title: 'وقاسيسيسيسيسيسيسيسة',
                                    subtitle: 'وقاسيسيسيسيسيسيسيسيسيسة',
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
                                ]),

                                // Upcoming Activities
                                _buildActivitiesList([
                                  ActivityItem(
                                    title: 'Upcoming Event 1',
                                    subtitle: 'Description for upcoming event',
                                    time: '06/27 15:00',
                                    participants: '12 people registered',
                                    image: 'assets/concert_bg.jpg',
                                  ),
                                ]),

                                // Enrolled Activities
                                _buildActivitiesList([
                                  ActivityItem(
                                    title: 'Enrolled Activity 1',
                                    subtitle: 'Your enrolled activity',
                                    time: '06/28 10:00',
                                    participants: 'You are enrolled',
                                    image: 'assets/game_bg.jpg',
                                  ),
                                ]),
                              ],
                            ),
                          ),
                        ],
                      ),

                      // Rewards Tab Content
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xFF2D1B69),
                              Color(0xFF1A1A2E),
                            ],
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25),
                          ),
                        ),
                        child: Column(
                          children: [
                            // Header
                            Container(
                              padding: EdgeInsets.all(20),
                              child: ShaderMask(
                                shaderCallback: (Rect bounds) {
                                  return const LinearGradient(
                                    colors: [
                                      Color(0xFFF77FCF), // وردي
                                      Color(0xFF8B5CF6), // بنفسجي
                                      Color(0xFF6DC8F3), // أزرق
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ).createShader(bounds);
                                },
                                child: Text(
                                  'Achievement medal for room activity',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),

                            // Achievements List
                            Expanded(
                              child: ListView(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                children: [
                                  _buildAchievementItem(
                                    icon: _buildMedalIcon(
                                        Colors.amber, Icons.emoji_events),
                                    title:
                                        'Organize 30 events with a cumulative total of 300 people enrolled in the 30 events',
                                    eventProgress: 'Events: 0/30',
                                    peopleProgress: 'Peoples: 0/300',
                                  ),
                                  _buildAchievementItem(
                                    icon: _buildMedalIcon(
                                        Colors.orange, Icons.military_tech),
                                    title:
                                        'Organize 50 events with a cumulative total of 500 people enrolled in the 50 events',
                                    eventProgress: 'Events: 0/50',
                                    peopleProgress: 'Peoples: 0/500',
                                  ),
                                  _buildAchievementItem(
                                    icon: _buildMedalIcon(
                                        Colors.red, Icons.workspace_premium),
                                    title:
                                        'Organize 177 events with a cumulative total of 2,000 people enrolled in the 177 events',
                                    eventProgress: 'Events: 0/177',
                                    peopleProgress: 'Peoples: 0/2000',
                                  ),
                                  _buildAchievementItem(
                                    icon: _buildMedalIcon(
                                        Colors.green, Icons.card_giftcard),
                                    title:
                                        'Sending gifts with total 3 millions in the rooms where you enroll to participate in activities.',
                                    eventProgress: 'Target records: 0/3000000',
                                    peopleProgress: '',
                                  ),
                                  _buildAchievementItem(
                                    icon: _buildMedalIcon(
                                        Colors.blue, Icons.diamond),
                                    title:
                                        'Sending gifts with total 10 millions in the rooms where you enroll to participate in activities.',
                                    eventProgress: 'Target records: 0/10000000',
                                    peopleProgress: '',
                                  ),
                                  _buildAchievementItem(
                                    icon: _buildMedalIcon(
                                        Colors.purple, Icons.auto_awesome),
                                    title:
                                        'Sending gifts with total 100 millions in the rooms where you enroll to participate in activities.',
                                    eventProgress:
                                        'Target records: 0/100000000',
                                    peopleProgress: '',
                                    isLast: true,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
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

  Widget _buildMedalIcon(Color color, IconData iconData) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [
            color.withOpacity(0.8),
            color.withOpacity(0.4),
          ],
        ),
        border: Border.all(
          color: Colors.amber.withOpacity(0.5),
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Crown/Medal base
          Container(
            width: 45,
            height: 45,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.amber,
                  Colors.orange,
                ],
              ),
            ),
          ),
          // Icon
          Icon(
            iconData,
            color: Colors.white,
            size: 24,
          ),
          // Sparkle effect
          Positioned(
            top: 5,
            right: 8,
            child: Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.8),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAchievementItem({
    required Widget icon,
    required String title,
    required String eventProgress,
    required String peopleProgress,
    bool isLast = false,
  }) {
    String getLabel(String text) => text.split(':').first;
    String getValue(String text) =>
        text.split(':').length > 1 ? text.split(':').last : '';
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Medal Image (PNG)
            Container(
              width: 80,
              height: 80,
              child: icon,
            ),
            SizedBox(width: 16.w),
            // Achievement Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      height: 1.4,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Text(
                        getLabel(eventProgress) + ': ',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                      Text(
                        getValue(eventProgress),
                        style: TextStyle(
                          color: Color(0xFFFFD600),
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  if (peopleProgress.isNotEmpty) ...[
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          getLabel(peopleProgress) + ': ',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                        Text(
                          getValue(peopleProgress),
                          style: TextStyle(
                            color: Color(0xFFFFD600),
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
        if (!isLast) ...[
          SizedBox(height: 20.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 80,
                alignment: Alignment.center,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white24,
                      size: 32,
                    ),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white,
                      size: 20,
                    ),
                    Positioned(
                      bottom: -6,
                      child: Container(
                        width: 6,
                        height: 6,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white.withOpacity(0.5),
                              blurRadius: 6,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // الخط مباشرة بعد السهم
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 220,
                height: 1,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.white.withOpacity(0.0),
                      Colors.white.withOpacity(0.18),
                      Colors.white.withOpacity(0.0),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 24),
        ],
      ],
    );
  }

  Widget _buildActivitiesList(List<ActivityItem> activities) {
    return ListView.builder(
      itemCount: activities.length,
      itemBuilder: (context, index) {
        final activity = activities[index];
        return Container(
          margin: EdgeInsets.only(bottom: 1.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              // Activity Image
              Container(
                width: 150.w,
                height: 90.h,
                margin: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF6366F1),
                      Color(0xFF8B5CF6),
                      Color(0xFFEC4899),
                    ],
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Stack(
                    children: [
                      // Placeholder for concert/game background
                      Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.blue.withOpacity(0.7),
                              Colors.purple.withOpacity(0.9),
                            ],
                          ),
                        ),
                        child: Icon(
                          Icons.music_note,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Activity Details
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        activity.title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 4),
                      Text(
                        activity.subtitle,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            size: 14,
                            color: Color(0xFF8B5CF6),
                          ),
                          SizedBox(width: 4),
                          Text(
                            activity.time,
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF8B5CF6),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(
                            Icons.people,
                            size: 14,
                            color: Colors.grey[600],
                          ),
                          SizedBox(width: 4),
                          Text(
                            activity.participants,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ActivityItem {
  final String title;
  final String subtitle;
  final String time;
  final String participants;
  final String image;

  ActivityItem({
    required this.title,
    required this.subtitle,
    required this.time,
    required this.participants,
    required this.image,
  });
}

class _ArrowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 2); // ظل خفيف

    final path = Path();
    path.moveTo(size.width / 2, 0); // رأس السهم
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
