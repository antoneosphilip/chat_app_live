import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:live_app/view/screens/bag/bag_screen.dart';
import 'package:live_app/view/screens/guild/guild_screen.dart';
import 'package:live_app/view/screens/store/new_store_screen.dart';
import 'package:live_app/view/screens/vip/new_vip_screen.dart';
import 'package:live_app/view/screens/vip/vip_screen.dart';

class MineOther extends StatelessWidget {
  const MineOther({super.key});

  @override
  Widget build(BuildContext context) {
    final List<_MineIconData> items = [
      _MineIconData(
          '👑', 'Vip', Colors.orange, () => Get.to(() => NewVipScreen())),
      _MineIconData(
          '🏪', 'Store', Colors.pink, () => Get.to(() => GameStoreScreen())),
      _MineIconData('🎒', 'Bag', Colors.teal, () => Get.to(() => BagScreen())),
      _MineIconData('💌', 'Invite', Colors.blue, () => print('Invite tapped')),
      _MineIconData(
          '🛡️', 'Guild', Colors.purple, () => Get.to(() => GuildScreen())),
      _MineIconData('📋', 'Task', Colors.green, () => print('Task tapped')),
      _MineIconData(
          '🎁', 'Rewards', Colors.orange, () => print('Rewards tapped')),
      _MineIconData('🏆', 'Points Center', Colors.amber,
          () => print('Points Center tapped')),
    ];
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: items.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 30,
              crossAxisSpacing: 8,
              childAspectRatio: 0.8,
            ),
            itemBuilder: (context, index) {
              final item = items[index];
              return GestureDetector(
                onTap: item.onTap,
                child: _buildIconItem(item.emoji, item.label, item.color),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildIconItem(String emoji, String label, Color color) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Center(
          child: Text(
            emoji,
            style: TextStyle(fontSize: 28.sp),
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w500,
            color: Colors.grey[900],
            height: 1.2,
          ),
        ),
      ],
    );
  }
}

class _MineIconData {
  final String emoji;
  final String label;
  final Color color;
  final VoidCallback onTap;
  _MineIconData(this.emoji, this.label, this.color, this.onTap);
}
