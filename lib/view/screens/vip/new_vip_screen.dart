import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewVipScreen extends StatelessWidget {
  const NewVipScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(height: 32.h),
          _VipTabBarWithIcons(selected: 0),
          SizedBox(height: 24.h),
          _VipBadgeSection(),
          SizedBox(height: 18.h),
          _VipLockedSection(),
          SizedBox(height: 8.h),
          _VipPrivilegesCount(),
          SizedBox(height: 24.h),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _VipRewardsSection(),
                  SizedBox(height: 24.h),
                  _VipSocialPrivilegesSection(),
                  SizedBox(height: 80.h),
                  _VipMemberExclusivePrivilegesSection(),
                  _VipOtherBenefitsSection(),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _VipBottomBar(),
    );
  }
}

class _VipTabBarWithIcons extends StatelessWidget {
  final int selected;
  const _VipTabBarWithIcons({this.selected = 0});
  @override
  Widget build(BuildContext context) {
    final List<String> vips = [
      'VIP7',
      'VIP6',
      'VIP5',
      'VIP4',
      'VIP3',
      'VIP2',
      'VIP1'
    ];
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back_ios_new_rounded,
                color: Colors.white, size: 22.w),
            onPressed: () => Navigator.of(context).pop(),
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                vips.length,
                (i) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        vips[i],
                        style: TextStyle(
                          color: i == selected
                              ? Color(0xFFFFB800)
                              : Color(0xFFE0E0E0),
                          fontWeight: i == selected
                              ? FontWeight.bold
                              : FontWeight.normal,
                          fontSize: 14.sp,
                          letterSpacing: 0.2,
                        ),
                      ),
                      SizedBox(height: 2.h),
                      AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        curve: Curves.ease,
                        width: i == selected ? 18.w : 0,
                        height: i == selected ? 4.h : 0,
                        decoration: BoxDecoration(
                          color: i == selected
                              ? Color(0xFFFFB800)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(2.r),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.help_outline, color: Colors.white, size: 22.w),
            onPressed: () {},
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(),
          ),
        ],
      ),
    );
  }
}

class _VipBadgeSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Lion badge with glow and crown
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 170.w,
              height: 170.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.amber.shade400,
                boxShadow: [
                  BoxShadow(
                    color: Colors.yellow.withOpacity(0.7),
                    blurRadius: 60.r,
                    spreadRadius: 20.r,
                  ),
                ],
              ),
            ),
            // Lion icon
            Icon(Icons.pets, color: Colors.white, size: 100.w),
            // Crown icon overlay
            Positioned(
              top: 32.w,
              child: Icon(Icons.emoji_events,
                  color: Colors.amber.shade900, size: 40.w),
            ),
          ],
        ),
        SizedBox(height: 18.h),
        // Locked pill button
        Container(
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 6.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 8.r,
                offset: Offset(0, 2.h),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.lock, color: Colors.black, size: 18.w),
              SizedBox(width: 6.w),
              Text('Locked',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        SizedBox(height: 8.h),

        Text(
          'More privileges for upgrading VIP',
          style: TextStyle(color: Colors.white70, fontSize: 13.sp),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 16.h),
        // Decorative gold bar (placeholder)
        Icon(Icons.emoji_events, color: Colors.amber, size: 48.w),
      ],
    );
  }
}

class _VipLockedSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     Icon(Icons.lock, color: Colors.white, size: 20.w),
        //     SizedBox(width: 6.w),
        //     Text('Locked',
        //         style: TextStyle(color: Colors.white, fontSize: 16.sp)),
        //   ],
        // ),
        // SizedBox(height: 4.h),
        // Text('More privileges for upgrading VIP',
        //     style: TextStyle(color: Colors.white70, fontSize: 13.sp)),
      ],
    );
  }
}

class _VipPrivilegesCount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.7),
          borderRadius: BorderRadius.circular(18.r),
          border: Border.all(color: Colors.white24, width: 1.2.w),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 8.r,
              offset: Offset(0, 2.h),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.emoji_events, color: Color(0xFFFFB800), size: 22.w),
            SizedBox(width: 8.w),
            Text('Privileges ',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500)),
            Text('25',
                style: TextStyle(
                    color: Color(0xFFFFB800),
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold)),
            Text('/25',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500)),
            SizedBox(width: 8.w),
            Icon(Icons.emoji_events, color: Colors.white24, size: 18.w),
          ],
        ),
      ),
    );
  }
}

class _VipRewardsSection extends StatelessWidget {
  static const List<Map<String, dynamic>> rewards = [
    {'title': 'Room Card', 'icon': Icons.meeting_room},
    {'title': 'Entrance Banner', 'icon': Icons.emoji_flags},
    {'title': 'Exclusive Avatar-Wear', 'icon': Icons.verified_user},
    {'title': 'Chat Bubbles', 'icon': Icons.chat_bubble_outline},
    {'title': 'Mic Sound Wave', 'icon': Icons.graphic_eq},
    {'title': 'Colored Nicknames', 'icon': Icons.text_fields},
    {'title': 'Membership', 'icon': Icons.card_membership},
  ];

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
              return _VipRewardIcon(
                  title: reward['title'], icon: reward['icon']);
            },
          ),
        ),
      ],
    );
  }
}

class _VipRewardIcon extends StatelessWidget {
  final String title;
  final IconData icon;
  const _VipRewardIcon({required this.title, required this.icon});
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
  const VipPrivilegeDetailsSheet({required this.title, Key? key})
      : super(key: key);

  static const List<Map<String, dynamic>> privileges = [
    {'title': 'Room Card', 'icon': Icons.meeting_room},
    {'title': 'Entrance Banner', 'icon': Icons.emoji_flags},
    {'title': 'Exclusive Avatar-Wear', 'icon': Icons.verified_user},
    {'title': 'Chat Bubbles', 'icon': Icons.chat_bubble_outline},
    {'title': 'Mic Sound Wave', 'icon': Icons.graphic_eq},
    {'title': 'Colored Nicknames', 'icon': Icons.text_fields},
    {'title': 'Membership', 'icon': Icons.card_membership},
  ];

  @override
  Widget build(BuildContext context) {
    final selectedIndex = privileges.indexWhere((p) => p['title'] == title);
    return Container(
      margin: EdgeInsets.only(top: 8.h),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.95),
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      padding: EdgeInsets.only(top: 8.h, left: 12.w, right: 12.w, bottom: 8.h),
      child: SizedBox(
        height: 0.8.sh, // 80% of screen height
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Top bar
              Row(
                children: [
                  Expanded(
                    child: Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.emoji_events,
                              color: Color(0xFFFFB800), size: 22.w),
                          SizedBox(width: 8.w),
                          Text('Privileges ',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500)),
                          Text('25',
                              style: TextStyle(
                                  color: Color(0xFFFFB800),
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold)),
                          Text('/25',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500)),
                          SizedBox(width: 8.w),
                          Icon(Icons.emoji_events,
                              color: Colors.white24, size: 18.w),
                        ],
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.close, color: Colors.white, size: 24.w),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              // Horizontal privilege icons row
              SizedBox(
                height: 80.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: privileges.length,
                  separatorBuilder: (_, __) => SizedBox(width: 12.w),
                  itemBuilder: (context, i) {
                    final isSelected = i == selectedIndex;
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            if (isSelected)
                              Positioned(
                                bottom: 0,
                                child: Container(
                                  width: 44.w,
                                  height: 10.h,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.amber.withOpacity(0.7),
                                        blurRadius: 16.r,
                                        spreadRadius: 1.r,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            Container(
                              width: 44.w,
                              height: 44.w,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: SweepGradient(
                                  colors: [
                                    isSelected
                                        ? Color(0xFFFFB800)
                                        : Color(0xFFFFE082),
                                    Color(0xFFFFE082),
                                    Color(0xFFFFB800),
                                    Color(0xFFFFE082),
                                    Color(0xFFFFB800),
                                  ],
                                  startAngle: 0.0,
                                  endAngle: 3.14 * 2,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: isSelected
                                        ? Colors.amber.withOpacity(0.5)
                                        : Colors.amber.withOpacity(0.2),
                                    blurRadius: 8.r,
                                    spreadRadius: 1.r,
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Icon(
                                  privileges[i]['icon'],
                                  color: isSelected
                                      ? Color(0xFFFFB800)
                                      : Colors.white,
                                  size: 22.w,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4.h),
                        SizedBox(
                          width: 60.w,
                          child: Text(
                            privileges[i]['title'],
                            style: TextStyle(
                              color:
                                  isSelected ? Color(0xFFFFB800) : Colors.white,
                              fontSize: 12.sp,
                              fontWeight: isSelected
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(height: 10.h),
              // Glowing divider
              Container(
                width: double.infinity,
                height: 2.h,
                margin: EdgeInsets.symmetric(vertical: 0),
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(2.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.18),
                      blurRadius: 8.r,
                      spreadRadius: 1.r,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              // Title with sparkles
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.auto_awesome,
                      color: Colors.white.withOpacity(0.85), size: 22.w),
                  SizedBox(width: 8.w),
                  Text(title,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold)),
                  SizedBox(width: 8.w),
                  Icon(Icons.auto_awesome,
                      color: Colors.white.withOpacity(0.85), size: 22.w),
                ],
              ),
              SizedBox(height: 8.h),
              Text(
                'Exclusive avatar-wear for VIPs to make their avatars unique',
                style: TextStyle(color: Colors.white70, fontSize: 15.sp),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16.h),
              // Row of images (VIP tags)
              SizedBox(
                height: 56.w,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 7,
                  separatorBuilder: (_, __) => SizedBox(width: 16.w),
                  itemBuilder: (context, i) => Image.asset(
                    'assets/images/top1.webp',
                    width: 56.w,
                    height: 56.w,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              // Users grid
              ListView.separated(
                  separatorBuilder: (_, __) => SizedBox(height: 16.h),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 9,
                  itemBuilder: (context, i) => VipUsersGrid()
                  ),
            ],
          ),
        ),
      ),
    );
  }
}

class _VipSocialPrivilegesSection extends StatelessWidget {
  static const List<Map<String, dynamic>> privileges = [
    {'title': 'Follower\n*700%', 'icon': Icons.sync},
    {'title': 'Fans * 700%', 'icon': Icons.person_add_alt_1},
    {'title': 'Any Private\nChat', 'icon': Icons.chat_bubble},
    {'title': 'View\nVisitors', 'icon': Icons.person_search},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 8.h, bottom: 8.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.auto_awesome,
                  color: Colors.white.withOpacity(0.85), size: 22.w),
              SizedBox(width: 10.w),
              Text(
                'Social interaction privileges',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17.sp,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.2,
                ),
              ),
              SizedBox(width: 10.w),
              Icon(Icons.auto_awesome,
                  color: Colors.white.withOpacity(0.85), size: 22.w),
            ],
          ),
        ),
        SizedBox(height: 10.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: privileges
                .map((priv) => _SocialPrivilegeIcon(
                    title: priv['title'], icon: priv['icon']))
                .toList(),
          ),
        ),
      ],
    );
  }
}

class _SocialPrivilegeIcon extends StatelessWidget {
  final String title;
  final IconData icon;
  const _SocialPrivilegeIcon({required this.title, required this.icon});
  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}

class _VipMemberExclusivePrivilegesSection extends StatelessWidget {
  static const List<Map<String, dynamic>> privileges = [
    {'title': 'Top-Ranked', 'icon': Icons.bar_chart},
    {'title': 'Online Invisibility', 'icon': Icons.visibility_off},
    {'title': 'Preventing being', 'icon': Icons.person_off},
    {'title': 'Avoid being\nMic-disabled', 'icon': Icons.mic_off},
    {'title': 'Rankings Invisibility', 'icon': Icons.visibility_off_outlined},
    {
      'title': 'Hide from\nVisitors List',
      'icon': Icons.remove_red_eye_outlined
    },
    {'title': 'Online Broadcast', 'icon': Icons.notifications_active},
    {'title': 'Membership\nBroadcast', 'icon': Icons.campaign},
    {'title': 'Anti-track', 'icon': Icons.shield},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 16.h, bottom: 8.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.auto_awesome,
                  color: Colors.white.withOpacity(0.85), size: 22.w),
              SizedBox(width: 10.w),
              Text(
                'Member-exclusive privileges',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17.sp,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.2,
                ),
              ),
              SizedBox(width: 10.w),
              Icon(Icons.auto_awesome,
                  color: Colors.white.withOpacity(0.85), size: 22.w),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: privileges.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              mainAxisSpacing: 18.h,
              crossAxisSpacing: 8.w,
              childAspectRatio: 0.95,
            ),
            itemBuilder: (context, index) {
              final priv = privileges[index];
              return _VipRewardIcon(title: priv['title'], icon: priv['icon']);
            },
          ),
        ),
      ],
    );
  }
}

class _VipOtherBenefitsSection extends StatelessWidget {
  static const List<Map<String, dynamic>> benefits = [
    {'title': 'Check-in\nBonus', 'icon': Icons.card_giftcard},
    {'title': 'PK Props\nDiscount', 'icon': Icons.confirmation_num},
    {'title': 'Store\nDiscounts', 'icon': Icons.store},
    {'title': 'Level\nAcceleration', 'icon': Icons.trending_up},
    {'title': 'Room\nExclusive', 'icon': Icons.star},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 16.h, bottom: 8.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.auto_awesome,
                  color: Colors.white.withOpacity(0.85), size: 22.w),
              SizedBox(width: 10.w),
              Text(
                'Other offers and benefits',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17.sp,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.2,
                ),
              ),
              SizedBox(width: 10.w),
              Icon(Icons.auto_awesome,
                  color: Colors.white.withOpacity(0.85), size: 22.w),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: benefits.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              mainAxisSpacing: 18.h,
              crossAxisSpacing: 8.w,
              childAspectRatio: 0.95,
            ),
            itemBuilder: (context, index) {
              final benefit = benefits[index];
              return _VipRewardIcon(
                  title: benefit['title'], icon: benefit['icon']);
            },
          ),
        ),
      ],
    );
  }
}

class _VipBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border(top: BorderSide(color: Colors.amber, width: 2.w)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('78000.0days',
                    style: TextStyle(
                        color: Colors.amber,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 2.h),
                Text('You need to top up \$18000 to receive it',
                    style: TextStyle(color: Colors.white, fontSize: 12.sp)),
              ],
            ),
          ),
          SizedBox(width: 10.w),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber,
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r)),
              elevation: 0,
            ),
            onPressed: () {},
            child: Text('Recharge',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}

class VipUsersGrid extends StatelessWidget {
  const VipUsersGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Color(0xFFFFD700), width: 1.2.w),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            blurRadius: 12.r,
            spreadRadius: 1.r,
          ),
        ],
      ),
      padding: EdgeInsets.all(8.w),
      child: Column(
        children: [
          // Top bar inside container
          Container(
            margin: EdgeInsets.symmetric(horizontal: 2.w),
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.08),
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.08),
                  blurRadius: 8.r,
                  spreadRadius: 1.r,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.emoji_events, color: Color(0xFFFFD700), size: 18.w),
                SizedBox(width: 4.w),
                Text('17.4M',
                    style: TextStyle(
                        color: Color(0xFFFFD700),
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold)),
                SizedBox(width: 16.w),
                Icon(Icons.music_note, color: Colors.white, size: 18.w),
                SizedBox(width: 4.w),
                Text('Play Music',
                    style: TextStyle(color: Colors.white, fontSize: 13.sp)),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          // Users grid
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 9,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              mainAxisSpacing: 12.h,
              crossAxisSpacing: 8.w,
              childAspectRatio: 0.5.h,
            ),
            itemBuilder: (context, i) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    CircleAvatar(
                      radius: 28.w,
                      backgroundImage:
                          AssetImage('assets/images/top1.webp'), // Placeholder
                    ),
                    Positioned(
                      bottom: 0,
                      child: Image.asset(
                        'assets/images/top1.webp',
                        width: 36.w,
                        height: 20.h,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                Text(
                  i == 4 ? 'Username' : 'اسم المستخدم',
                  style: TextStyle(
                    color: i == 4 ? Colors.amber : Colors.white,
                    fontSize: 12.sp,
                    fontWeight: i == 4 ? FontWeight.bold : FontWeight.normal,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 2.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.card_giftcard,
                        color: Colors.redAccent, size: 14.w),
                    SizedBox(width: 2.w),
                    Text('678',
                        style: TextStyle(color: Colors.white, fontSize: 11.sp)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
