import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GameCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Gradient gradient;
  final VoidCallback? onStart;
  final bool isDownloaded;

  const GameCard({
    Key? key,
    required this.title,
    this.subtitle,
    required this.gradient,
    this.onStart,
    this.isDownloaded = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.h,
      margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 8.w),
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(
          color: const Color(0xFFFFD700),
          width: 2,
        ),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Container(
              // margin: const EdgeInsets.only(left: 12, right: 8),
              width: 100.w,
              height: 100.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: const Color(0xFFFFD700),
                  width: 3,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.amber.withOpacity(0.2),
                    blurRadius: 6,
                  ),
                ],
              ),
              child: Center(
                child: Icon(Icons.videogame_asset,
                    color: const Color(0xFFFFD700), size: 32.sp),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 18.0, horizontal: 4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if (subtitle != null)
                          Text(
                            subtitle!,
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 12.sp,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: onStart,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 24.w, vertical: 10.h),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFFFFE066), Color(0xFFFFB347)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(24),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.orange.withOpacity(0.2),
                                blurRadius: 4,
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Text(
                                'Start',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.sp,
                                  shadows: const [
                                    Shadow(color: Colors.black26, blurRadius: 2)
                                  ],
                                ),
                              ),
                              SizedBox(width: 6.w),
                              Icon(Icons.double_arrow,
                                  color: Colors.white, size: 20.sp),
                            ],
                          ),
                        ),
                      ),
                      Spacer(),
                      Icon(
                        isDownloaded
                            ? Icons.check_circle
                            : Icons.download_rounded,
                        color: isDownloaded ? Colors.greenAccent : Colors.white,
                        size: 28.sp,
                      ),
                      SizedBox(width: 12.w),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

final List<Map<String, dynamic>> games = [
  {
    'title': 'Carrom',
    'subtitle': null,
    'gradient': LinearGradient(
      colors: [Color(0xFF00C9A7), Color(0xFF00B894)],
    ),
  },
  {
    'title': 'Uno',
    'subtitle': null,
    'gradient': LinearGradient(
      colors: [Color(0xFF6C5CE7), Color(0xFF5A4FCF)],
    ),
  },
  {
    'title': 'Ludo',
    'subtitle': 'Ludo Battle',
    'gradient': LinearGradient(
      colors: [Color(0xFFE17055), Color(0xFFD63031)],
    ),
  },
  {
    'title': 'Snakes & Ladders',
    'subtitle': 'Classic and exciting Snakes &',
    'gradient': LinearGradient(
      colors: [Color(0xFF00C9A7), Color(0xFF00B894)],
    ),
  },
];
