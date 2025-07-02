import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventItem {
  final String title;
  final String subtitle;
  final String? timeText;
  final List<Color> colors;
  final bool hasWings;
  final bool isGolden;
  final bool hasStars;

  EventItem({
    required this.title,
    this.subtitle = '',
    this.timeText,
    required this.colors,
    required this.hasWings,
    required this.isGolden,
    this.hasStars = false,
  });
}

class EventCardWidget extends StatelessWidget {
  final EventItem event;
  const EventCardWidget({Key? key, required this.event}) : super(key: key);

  Widget _buildWing(bool isLeft) {
    return Transform.scale(
      scaleX: isLeft ? 1 : -1,
      child: Container(
        width: 60.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: Colors.amber.withOpacity(0.8),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30.r),
            bottomRight: Radius.circular(30.r),
            topLeft: Radius.circular(10.r),
            bottomLeft: Radius.circular(10.r),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.amber.withOpacity(0.5),
              blurRadius: 8.r,
              offset: Offset(0, 2.h),
            ),
          ],
        ),
        child: CustomPaint(
          painter: WingPainter(),
        ),
      ),
    );
  }

  Widget _buildGem(Color color) {
    return Container(
      width: 16.w,
      height: 16.w,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 1.w),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.5),
            blurRadius: 4.r,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      height: 150.h,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: event.colors,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8.r,
            offset: Offset(0, 4.h),
          ),
        ],
      ),
      child: Stack(
        children: [
          if (event.hasWings) ...[
            Positioned(
              left: -20.w,
              top: 10.h,
              child: _buildWing(true),
            ),
            Positioned(
              right: -20.w,
              top: 10.h,
              child: _buildWing(false),
            ),
          ],
          if (event.hasStars) ...[
            Positioned(
              left: 20.w,
              top: 20.h,
              child: Icon(Icons.star, color: Colors.white, size: 16.w),
            ),
            Positioned(
              right: 30.w,
              top: 30.h,
              child: Icon(Icons.star, color: Colors.white, size: 12.w),
            ),
            Positioned(
              left: 40.w,
              bottom: 25.h,
              child: Icon(Icons.star, color: Colors.white, size: 14.w),
            ),
            Positioned(
              right: 50.w,
              bottom: 20.h,
              child: Icon(Icons.star, color: Colors.white, size: 10.w),
            ),
          ],
          Positioned.fill(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (event.timeText != null) ...[
                    Text(
                      event.timeText!,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 8.h),
                  ],
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                    decoration: BoxDecoration(
                      color: event.isGolden ? Color(0xFFFFD700) : Colors.white,
                      borderRadius: BorderRadius.circular(25.r),
                      border: Border.all(
                        color: event.isGolden
                            ? Color(0xFFB8860B)
                            : Colors.grey.shade300,
                        width: 2.w,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4.r,
                          offset: Offset(0, 2.h),
                        ),
                      ],
                    ),
                    child: Text(
                      event.title,
                      style: TextStyle(
                        color:
                            event.isGolden ? Color(0xFF8B4513) : Colors.black,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  if (event.subtitle.isNotEmpty) ...[
                    SizedBox(height: 8.h),
                    Text(
                      event.subtitle,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ],
              ),
            ),
          ),
          if (event.isGolden) ...[
            Positioned(
              left: 10.w,
              top: 15.h,
              child: _buildGem(Colors.red),
            ),
            Positioned(
              right: 10.w,
              top: 15.h,
              child: _buildGem(Colors.blue),
            ),
            Positioned(
              left: 15.w,
              bottom: 15.h,
              child: _buildGem(Colors.green),
            ),
            Positioned(
              right: 15.w,
              bottom: 15.h,
              child: _buildGem(Colors.purple),
            ),
          ],
        ],
      ),
    );
  }
}

class WingPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.3)
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    final path = Path();
    path.moveTo(size.width * 0.2, size.height * 0.3);
    path.quadraticBezierTo(
      size.width * 0.6,
      size.height * 0.1,
      size.width * 0.8,
      size.height * 0.5,
    );
    path.quadraticBezierTo(
      size.width * 0.6,
      size.height * 0.9,
      size.width * 0.2,
      size.height * 0.7,
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
