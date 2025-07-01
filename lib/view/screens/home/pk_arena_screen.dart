import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PKArenaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            children: [
              // Rankings Section
              Container(
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFB24536), // أحمر داكن
                      Color(0xFFF8B500), // ذهبي
                      Color(0xFF3CA55C), // أخضر مزرق
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8.r,
                      offset: Offset(0, 4.h),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    // Rankings Title and Podium
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Rankings',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 12.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _buildPodiumItem(2, Color(0xFF4A90E2), '2'),
                              _buildPodiumItem(1, Color(0xFFFFD700), '1',
                                  isFirst: true),
                              _buildPodiumItem(3, Color(0xFFCD7F32), '3'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // Player Stats
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: EdgeInsets.all(10.w),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(16.r),
                          border: Border.all(color: Colors.amber, width: 2.w),
                        ),
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.green,
                              radius: 20.w,
                              child: Text(
                                'A',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ),
                            SizedBox(height: 6.h),
                            Text(
                              'Antoneos...',
                              style: TextStyle(
                                color: Colors.amber,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 2.h),
                            Text(
                              '✖ 0',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.sp,
                              ),
                            ),
                            SizedBox(height: 6.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('0',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12.sp)),
                                Icon(Icons.flash_on,
                                    color: Colors.amber, size: 16.w),
                                Text('0',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12.sp)),
                              ],
                            ),
                            SizedBox(height: 2.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('0',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 10.sp)),
                                Text('Victory',
                                    style: TextStyle(
                                        color: Colors.amber, fontSize: 10.sp)),
                                Text('0',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 10.sp)),
                              ],
                            ),
                            SizedBox(height: 2.h),
                            Text(
                              'Defeat',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 10.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40.h),
              // PK Battlefield Section
              Column(
                children: [
                  // PK Battlefield Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.w, vertical: 4.h),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Colors.purple, Colors.pink],
                              ),
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                            child: Text(
                              'PK',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12.sp,
                              ),
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            'PK Battlefield',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'More',
                            style: TextStyle(
                              color: Colors.cyan,
                              fontSize: 14.sp,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.cyan,
                            size: 16.w,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  // Battlefield Content
                  Container(
                    height: 120.h,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF2D1B69), Color(0xFF11998E)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(color: Colors.amber, width: 2.w),
                    ),
                    child: Stack(
                      children: [
                        // Left creature (icon)
                        Positioned(
                          left: 12.w,
                          top: 18.h,
                          child: Icon(Icons.pets,
                              color: Colors.redAccent, size: 48.w),
                        ),
                        // Right creature (icon)
                        Positioned(
                          right: 12.w,
                          top: 18.h,
                          child: Icon(Icons.pets,
                              color: Colors.blueAccent, size: 48.w),
                        ),
                        // Center message
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.shield,
                                  color: Colors.white, size: 32.w),
                              SizedBox(height: 8.h),
                              Text(
                                'No one is on PK for the moment, you\ncan click the button below to start a PK!',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 80.h), // Space for bottom button
            ],
          ),
        ),
      ),
      appBar: AppBar(
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
      ),
      bottomNavigationBar: SizedBox(
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
                    // الزخارف الجانبية (يمكنك تخصيصها أكثر لاحقاً)

                    // الزر الرئيسي كما هو
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
      ),
    );
  }

  Widget _buildPodiumItem(int position, Color color, String number,
      {bool isFirst = false}) {
    return Column(
      children: [
        Container(
          width: isFirst ? 44.w : 36.w,
          height: isFirst ? 44.w : 36.w,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            border: Border.all(
              color: isFirst ? Colors.amber : Colors.white,
              width: 2.w,
            ),
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.5),
                blurRadius: 8.r,
                offset: Offset(0, 2.h),
              ),
            ],
          ),
          child: Center(
            child: Text(
              number,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: isFirst ? 18.sp : 15.sp,
              ),
            ),
          ),
        ),
        if (isFirst)
          Container(
            margin: EdgeInsets.only(top: 2.h),
            child: Icon(
              Icons.emoji_events,
              color: Colors.amber,
              size: 18.w,
            ),
          ),
        SizedBox(height: 6.h),
        Container(
          width: isFirst ? 54.w : 44.w,
          height: isFirst ? 22.h : 16.h,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                color.withOpacity(0.8),
                color,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(4.r),
          ),
        ),
      ],
    );
  }
}
