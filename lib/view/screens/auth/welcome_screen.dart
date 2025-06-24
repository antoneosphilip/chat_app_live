import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:live_app/helper/route_helper.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF7EE8FA), // أزرق فاتح
              Color(0xFF80FF72), // أخضر فاتح
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const Spacer(flex: 2),
              // Logo
              Image.asset(
                'assets/icons/app_icon.png', // ضع هنا مسار اللوجو الصحيح
                width: 100.w,
                height: 100.w,
              ),
              SizedBox(height: 24.h),
              // App Name
              Text(
                'Sada',
                style: TextStyle(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 8.h),
              // Subtitle
              Text(
                'New ways to Entertainment',
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.white,
                ),
              ),
              const Spacer(flex: 2),
              // Login Buttons
              _LoginButton(
                icon: Icons.phone,
                text: 'WhatsApp',
                color: Colors.green,
                onTap: () {},
              ),
              SizedBox(height: 16.h),
              _LoginButton(
                icon: Icons.email,
                text: 'Email',
                color: Colors.blue,
                onTap: () {
          Get.toNamed(RouteHelper.getInitialRoute(fromSplash: true));
                },
              ),
              SizedBox(height: 16.h),
              _LoginButton(
                iconAsset: 'assets/icons/google.svg', // ضع أيقونة جوجل هنا
                text: 'Google',
                color: Colors.white,
                textColor: Colors.black,
                onTap: () {},
              ),
              const Spacer(),
              // OR
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(width: 60.w, height: 1, color: Colors.white24),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: Text('or', style: TextStyle(color: Colors.white70)),
                  ),
                  Container(width: 60.w, height: 1, color: Colors.white24),
                ],
              ),
              SizedBox(height: 16.h),
              // Social Icons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _CircleIcon(icon: Icons.phone_android, onTap: () {}),
                  SizedBox(width: 24.w),
                  _CircleIcon(iconAsset: 'assets/icons/face_book.svg', onTap: () {}),
                  SizedBox(width: 24.w),
                  _CircleIcon(icon: Icons.perm_identity, onTap: () {}),
                ],
              ),
              const Spacer(),
              // Terms
              Padding(
                padding: EdgeInsets.only(bottom: 16.h),
                child: Column(
                  children: [
                    Text(
                      'By logging in, you agree to',
                      style: TextStyle(color: Colors.white70, fontSize: 12.sp),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            'Terms of Service',
                            style: TextStyle(
                              color: Colors.white,
                              decoration: TextDecoration.underline,
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                        Text(' and ', style: TextStyle(color: Colors.white70, fontSize: 12.sp)),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            'Privacy Policy',
                            style: TextStyle(
                              color: Colors.white,
                              decoration: TextDecoration.underline,
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// زرار تسجيل الدخول
class _LoginButton extends StatelessWidget {
  final IconData? icon;
  final String? iconAsset;
  final String text;
  final Color color;
  final Color? textColor;
  final VoidCallback onTap;

  const _LoginButton({
    Key? key,
    this.icon,
    this.iconAsset,
    required this.text,
    required this.color,
    this.textColor,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(30.r),
        onTap: onTap,
        child: Container(
          width: 0.85.sw,
          height: 50.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 16.w),
              iconAsset != null
                  ? SvgPicture.asset(iconAsset!, width: 24.w, height: 24.w)
                  : Icon(icon, color: color, size: 24.sp),
              SizedBox(width: 24.w),
              Text(
                text,
                style: TextStyle(
                  color: textColor ?? Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// أيقونة دائرية
class _CircleIcon extends StatelessWidget {
  final IconData? icon;
  final String? iconAsset;
  final VoidCallback onTap;

  const _CircleIcon({Key? key, this.icon, this.iconAsset, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(30.r),
      onTap: onTap,
      child: Container(
        width: 48.w,
        height: 48.w,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: iconAsset != null
              ? SvgPicture.asset(iconAsset!, width: 24.w, height: 24.w)
              : Icon(icon, color: Colors.blue, size: 28.sp),
        ),
      ),
    );
  }
}