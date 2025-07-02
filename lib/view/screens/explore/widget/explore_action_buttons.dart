import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:live_app/view/screens/explore/widget/action_button_widget.dart';

class ExploreActionButtons extends StatelessWidget {
  final VoidCallback? onEvents;
  final VoidCallback? onPK;
  final VoidCallback? onInterviews;
  const ExploreActionButtons(
      {Key? key, this.onEvents, this.onPK, this.onInterviews})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          Expanded(
            child: ActionButtonWidget(
              title: 'Events',
              color: const Color(0xFFFF9800),
              icon: Icons.event,
              onTap: onEvents,
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: ActionButtonWidget(
              title: 'PK',
              color: const Color(0xFF2196F3),
              icon: Icons.sports_esports,
              onTap: onPK,
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: ActionButtonWidget(
              title: 'Interviews',
              color: const Color(0xFF9C27B0),
              icon: Icons.mic,
              onTap: onInterviews,
            ),
          ),
        ],
      ),
    );
  }
}
