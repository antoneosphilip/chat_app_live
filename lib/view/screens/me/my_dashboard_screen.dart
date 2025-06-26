import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:live_app/controller/user_controller.dart';
import 'package:live_app/util/dimensions.dart';
import 'package:live_app/view/screens/home/home_screen.dart';
import 'package:live_app/view/screens/me/widget/custom_app_bar.dart';
import 'package:live_app/view/screens/me/widget/mine_other.dart';
import 'package:live_app/view/screens/me/widget/mine_wallet.dart';
import 'package:live_app/view/screens/me/widget/shop_card.dart';
import 'package:live_app/view/screens/me/widget/user_image.dart';
import 'package:live_app/view/screens/me/widget/user_information_mine.dart';
import 'package:live_app/view/screens/me/widget/user_name_id.dart';

import '../../../controller/reltionship_controller.dart';

class MyDashboardScreen extends StatefulWidget {
  const MyDashboardScreen({Key? key}) : super(key: key);

  @override
  State<MyDashboardScreen> createState() => _MyDashboardScreenState();
}

class _MyDashboardScreenState extends State<MyDashboardScreen> {
  @override
  void initState() {
    Get.put(RelationshipController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(
      builder: (userController) {
        // final bool isLoggedIn = Get.find<AuthController>().isLoggedIn();
        return
            // userController.userInfoStatic != null
            Scaffold(
                backgroundColor: Colors.grey[100],
                appBar: CustomAppBarDashBoard(
                    height: 220.h,
                    tabBarwidget: Column(children: [
                      Padding(
                        padding: EdgeInsets.only(left: 16.w, top: 50.h),
                        child: const ProfileHeaderWidget(
                          name: 'Antoneos Philip',
                          id: '810052932',
                          blueCount: 1,
                          greenCount: 1,
                        ),
                      ),
                      SizedBox(height: 40.h),
                      UserInformationMine(
                        userController: userController,
                      ),
                      SizedBox(height: 10.h),
                    ])),
                body: SingleChildScrollView(
                  child: Ink(
                    padding: const EdgeInsets.only(top: 5),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(24.r),
                                  topLeft: Radius.circular(24.r))),
                          padding: EdgeInsets.only(
                            top: 10.h,
                          ),
                          child: Column(
                            children: [
                              MineWallet(
                                  // userController: userController,
                                  ),
                            ],
                          ),
                        ),
                        MineOther(
                            // userController: userController,
                            ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Column(
                            children: [
                              _buildMenuItem(
                                icon: Icons.image_outlined,
                                title: 'Banner Upload',
                                onTap: () => print('Banner Upload tapped'),
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              _buildMenuItem(
                                icon: Icons.settings_outlined,
                                title: 'Settings',
                                onTap: () => print('Settings tapped'),
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              _buildMenuItem(
                                icon: Icons.language_outlined,
                                title: 'Language',
                                onTap: () => print('Language tapped'),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 100.h,
                        ),
                      ],
                    ),
                  ),
                ));
        // : const LoadingIndicator();
      },
    );
  }
}

class ProfileHeaderWidget extends StatelessWidget {
  final String name;
  final String id;
  final int blueCount;
  final int greenCount;

  const ProfileHeaderWidget({
    Key? key,
    required this.name,
    required this.id,
    required this.blueCount,
    required this.greenCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // الدائرة بالحرف الأول
        Container(
          width: 80.w,
          height: 80.h,
          decoration: const BoxDecoration(
            color: Colors.green,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              name.isNotEmpty ? name[0].toUpperCase() : '',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 28.sp,
              ),
            ),
          ),
        ),
        SizedBox(width: 12.w),
        // الاسم وID
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18.sp,
              ),
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                Text(
                  'ID: $id',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(width: 4.w),
                Icon(Icons.copy, size: 16.sp, color: Colors.grey[600]),
              ],
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                _Badge(
                  color: Color(0xFFB3E5FC),
                  icon: Icons
                      .diamond, // استخدم أيقونة ألماسة أو صورة SVG إذا أردت
                  count: blueCount,
                  iconColor: Colors.blue[800]!,
                ),
                SizedBox(width: 6.w),
                _Badge(
                  color: Color(0xFFC8E6C9),
                  icon: Icons.verified, // استخدم أيقونة مناسبة أو صورة
                  count: greenCount,
                  iconColor: Colors.green[800]!,
                ),
              ],
            ),
          ],
        ),
        // الشارتين
      ],
    );
  }
}

class _Badge extends StatelessWidget {
  final Color color;
  final IconData icon;
  final int count;
  final Color iconColor;

  const _Badge({
    Key? key,
    required this.color,
    required this.icon,
    required this.count,
    required this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Icon(icon, color: iconColor, size: 16.sp),
          SizedBox(width: 2.w),
          Text(
            '$count',
            style: TextStyle(
              color: iconColor,
              fontWeight: FontWeight.bold,
              fontSize: 14.sp,
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildMenuItem({
  required IconData icon,
  required String title,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 6),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
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
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            // decoration: BoxDecoration(
            //   color: Colors.grey[100],
            //   borderRadius: BorderRadius.circular(8),
            // ),
            child: Icon(
              icon,
              color: Colors.black,
              size: 23.sp,
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
          ),
          Icon(
            Icons.chevron_right,
            color: Colors.grey[400],
            size: 20,
          ),
        ],
      ),
    ),
  );
}
