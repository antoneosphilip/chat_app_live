import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VipRewardsSection extends StatelessWidget {
  static const List<Map<String, dynamic>> rewards = [
    {'title': 'Room Card', 'icon': Icons.meeting_room},
    {'title': 'Entrance Banner', 'icon': Icons.emoji_flags},
    {'title': 'Exclusive Avatar-Wear', 'icon': Icons.verified_user},
    {'title': 'Chat Bubbles', 'icon': Icons.chat_bubble_outline},
    {'title': 'Mic Sound Wave', 'icon': Icons.graphic_eq},
    {'title': 'Colored Nicknames', 'icon': Icons.text_fields},
    {'title': 'Membership', 'icon': Icons.card_membership},
  ];

  const VipRewardsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.auto_awesome,
                  color: Colors.white.withOpacity(0.85), size: 24.w),
              SizedBox(width: 8.w),
              Text(
                'VIP Rewards',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.2,
                ),
              ),
              SizedBox(width: 8.w),
              Icon(Icons.auto_awesome,
                  color: Colors.white.withOpacity(0.85), size: 24.w),
            ],
          ),
        ),
        SizedBox(height: 10.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: rewards.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              mainAxisSpacing: 18.h,
              crossAxisSpacing: 8.w,
              childAspectRatio: 0.85,
            ),
            itemBuilder: (context, index) {
              final reward = rewards[index];
              return VipRewardIcon(
                  title: reward['title'], icon: reward['icon']);
            },
          ),
        ),
      ],
    );
  }
}

class VipRewardIcon extends StatelessWidget {
  final String title;
  final IconData icon;
  const VipRewardIcon({required this.title, required this.icon, Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (context) => VipPrivilegeDetailsSheet(title: title),
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 44.w,
            height: 44.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: SweepGradient(
                colors: [
                  Color(0xFFFFE082),
                  Color(0xFFFFB800),
                  Color(0xFFFFE082),
                  Color(0xFFFFB800),
                  Color(0xFFFFE082),
                ],
                startAngle: 0.0,
                endAngle: 3.14 * 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.amber.withOpacity(0.4),
                  blurRadius: 8.r,
                  spreadRadius: 1.r,
                ),
              ],
            ),
            child: Center(
              child: Icon(icon, color: Colors.white, size: 22.w),
            ),
          ),
          SizedBox(height: 4.h),
          SizedBox(
            width: 60.w,
            child: Text(
              title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.normal),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

class VipPrivilegeDetailsSheet extends StatelessWidget {
  final String title;
  const VipPrivilegeDetailsSheet({Key? key, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      padding: EdgeInsets.all(24.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40.w,
            height: 4.h,
            margin: EdgeInsets.only(bottom: 16.h),
            decoration: BoxDecoration(
              color: Colors.white24,
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),
          Text(
            title,
            style: TextStyle(
              color: Colors.amber,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            'تفاصيل الامتياز هنا ...',
            style: TextStyle(color: Colors.white, fontSize: 16.sp),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }
}
