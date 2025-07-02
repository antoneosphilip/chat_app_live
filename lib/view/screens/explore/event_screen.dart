import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:live_app/view/screens/explore/widget/events_center_appbar.dart';
import 'package:live_app/view/screens/explore/widget/event_card_widget.dart'
    show EventCardWidget, EventItem;

class EventsCenterScreen extends StatelessWidget {
  EventsCenterScreen({Key? key}) : super(key: key);

  final List<EventItem> events = [
    EventItem(
      title: 'مهمة ID جديد',
      colors: [Color(0xFF8B4513), Color(0xFFFF8C00), Color(0xFFFFD700)],
      hasWings: true,
      isGolden: true,
    ),
    EventItem(
      title: 'عالم جديد',
      subtitle: 'مكافآت لدعم الأسبوع الأول',
      timeText: '05/29 0:00 -- 07/29 23:59 (GMT+3)',
      colors: [Color(0xFF4B0082), Color(0xFF8A2BE2), Color(0xFFDA70D6)],
      hasWings: false,
      isGolden: false,
    ),
    EventItem(
      title: 'SADA',
      subtitle: 'مكافآت لدعم الأسبوع الأول',
      colors: [Color(0xFF8B4513), Color(0xFFFF8C00), Color(0xFFFFD700)],
      hasWings: true,
      isGolden: true,
    ),
    EventItem(
      title: 'SADA',
      subtitle: 'مسابقة تسريع الوكالة',
      colors: [Color(0xFF1E90FF), Color(0xFF00BFFF), Color(0xFF87CEEB)],
      hasWings: true,
      isGolden: true,
    ),
    EventItem(
      title: 'كرنفال',
      subtitle: 'UNO',
      colors: [Color(0xFF4B0082), Color(0xFF8A2BE2), Color(0xFFFF1493)],
      hasWings: false,
      isGolden: false,
      hasStars: true,
    ),
    EventItem(
      title: 'SADA',
      subtitle: 'ملك السجائر المتريدة',
      colors: [Color(0xFF8B4513), Color(0xFFFF8C00), Color(0xFFDAA520)],
      hasWings: true,
      isGolden: true,
    ),
    EventItem(
      title: '',
      subtitle: '',
      colors: [Color(0xFF006400), Color(0xFF32CD32), Color(0xFF7CFC00)],
      hasWings: true,
      isGolden: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF7F7FD5), Color(0xFF91EAE4)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const EventsCenterAppBar(),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 8.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.r),
                      topRight: Radius.circular(20.r),
                    ),
                  ),
                  child: ListView.builder(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                    itemCount: events.length,
                    itemBuilder: (context, index) {
                      return EventCardWidget(event: events[index]);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
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
