import 'package:flutter/material.dart';

class CustomAppBarDashBoard extends StatelessWidget
    implements PreferredSizeWidget {
  final Widget tabBarwidget;
  final double? height;

  const CustomAppBarDashBoard({
    Key? key,
    required this.tabBarwidget,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.0, 0.15, 0.3, 1.0], // جزء صغير ملون من الأعلى والباقي رمادي
          colors: [
            Color(0xFFFF6B6B), // Light red/pink في الأعلى
            Color(0xFFFFB347), // Orange
            Color(0xFFF0F0F0), // رمادي فاتح جداً
            Color(0xFFE8E8E8), // رمادي فاتح
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
