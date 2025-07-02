import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoomActivitiesRewardsSection extends StatelessWidget {
  const RoomActivitiesRewardsSection({Key? key}) : super(key: key);

  Widget _buildMedalIcon(Color color, IconData iconData) {
    return Container(
      width: 60.w,
      height: 60.w,
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
          width: 2.w,
        ),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.3),
            blurRadius: 10.r,
            offset: Offset(0, 4.h),
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 45.w,
            height: 45.w,
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
          Icon(iconData, color: Colors.white, size: 24.w),
          Positioned(
            top: 5,
            right: 8,
            child: Container(
              width: 8.w,
              height: 8.w,
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
            Container(
              width: 80.w,
              height: 80.w,
              child: icon,
            ),
            SizedBox(width: 16.w),
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
                          fontSize: 13.sp,
                        ),
                      ),
                      Text(
                        getValue(eventProgress),
                        style: TextStyle(
                          color: Color(0xFFFFD600),
                          fontWeight: FontWeight.bold,
                          fontSize: 13.sp,
                        ),
                      ),
                    ],
                  ),
                  if (peopleProgress.isNotEmpty) ...[
                    SizedBox(height: 4.h),
                    Row(
                      children: [
                        Text(
                          getLabel(peopleProgress) + ': ',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 13.sp,
                          ),
                        ),
                        Text(
                          getValue(peopleProgress),
                          style: TextStyle(
                            color: Color(0xFFFFD600),
                            fontWeight: FontWeight.bold,
                            fontSize: 13.sp,
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
                width: 80.w,
                alignment: Alignment.center,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white24,
                      size: 32.w,
                    ),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white,
                      size: 20.w,
                    ),
                    Positioned(
                      bottom: -6,
                      child: Container(
                        width: 6.w,
                        height: 6.w,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 220.w,
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
          SizedBox(height: 24.h),
        ],
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF2D1B69),
            Color(0xFF1A1A2E),
          ],
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.r),
          topRight: Radius.circular(25.r),
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20.w),
            child: ShaderMask(
              shaderCallback: (Rect bounds) {
                return const LinearGradient(
                  colors: [
                    Color(0xFFF77FCF),
                    Color(0xFF8B5CF6),
                    Color(0xFF6DC8F3),
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ).createShader(bounds);
              },
              child: Text(
                'Achievement medal for room activity',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              children: [
                _buildAchievementItem(
                  icon: _buildMedalIcon(Colors.amber, Icons.emoji_events),
                  title:
                      'Organize 30 events with a cumulative total of 300 people enrolled in the 30 events',
                  eventProgress: 'Events: 0/30',
                  peopleProgress: 'Peoples: 0/300',
                ),
                _buildAchievementItem(
                  icon: _buildMedalIcon(Colors.orange, Icons.military_tech),
                  title:
                      'Organize 50 events with a cumulative total of 500 people enrolled in the 50 events',
                  eventProgress: 'Events: 0/50',
                  peopleProgress: 'Peoples: 0/500',
                ),
                _buildAchievementItem(
                  icon: _buildMedalIcon(Colors.red, Icons.workspace_premium),
                  title:
                      'Organize 177 events with a cumulative total of 2,000 people enrolled in the 177 events',
                  eventProgress: 'Events: 0/177',
                  peopleProgress: 'Peoples: 0/2000',
                ),
                _buildAchievementItem(
                  icon: _buildMedalIcon(Colors.green, Icons.card_giftcard),
                  title:
                      'Sending gifts with total 3 millions in the rooms where you enroll to participate in activities.',
                  eventProgress: 'Target records: 0/3000000',
                  peopleProgress: '',
                ),
                _buildAchievementItem(
                  icon: _buildMedalIcon(Colors.blue, Icons.diamond),
                  title:
                      'Sending gifts with total 10 millions in the rooms where you enroll to participate in activities.',
                  eventProgress: 'Target records: 0/10000000',
                  peopleProgress: '',
                ),
                _buildAchievementItem(
                  icon: _buildMedalIcon(Colors.purple, Icons.auto_awesome),
                  title:
                      'Sending gifts with total 100 millions in the rooms where you enroll to participate in activities.',
                  eventProgress: 'Target records: 0/100000000',
                  peopleProgress: '',
                  isLast: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
