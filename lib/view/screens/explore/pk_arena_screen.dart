import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'widget/pk_arena_rankings.dart';
import 'widget/pk_arena_battlefield.dart';

class PKArenaScreen extends StatelessWidget {
  const PKArenaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: const _PKArenaAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            children: [
              const PKArenaRankings(),
              SizedBox(height: 40.h),
              const PKArenaBattlefield(),
              SizedBox(height: 80.h),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const _PKArenaBottomButton(),
    );
  }
}

class _PKArenaAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _PKArenaAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: const Color(0xFF16213E),
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.white, size: 24.w),
        onPressed: () {},
      ),
      title: Text(
        'PK Arena',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.help_outline, color: Colors.white, size: 24.w),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _PKArenaBottomButton extends StatelessWidget {
  const _PKArenaBottomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130.h,
      child: SafeArea(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 4.w),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF0f2027), Color(0xFF2c5364)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              border: Border.all(color: Colors.amber, width: 1.2.w),
            ),
            child: SizedBox(
              height: 60.h,
              width: double.infinity,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 70.w),
                    child: Container(
                      width: double.infinity,
                      height: 54.h,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF1CB5E0), Color(0xFF000046)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(18.r),
                        border: Border.all(color: Colors.amber, width: 3.w),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.amber.withOpacity(0.2),
                            blurRadius: 8.r,
                            offset: Offset(0, 2.h),
                          ),
                        ],
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(18.r),
                          onTap: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.sports_martial_arts,
                                color: Colors.white,
                                size: 32.w,
                              ),
                              SizedBox(width: 12.w),
                              Text(
                                'Start PK',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 80.w,
                    child: Icon(Icons.auto_awesome,
                        color: Colors.amber, size: 28.w),
                  ),
                  Positioned(
                    right: 80.w,
                    child: Icon(Icons.auto_awesome,
                        color: Colors.amber, size: 28.w),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
