import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActivityItem {
  final String title;
  final String subtitle;
  final String time;
  final String participants;
  final String image;
  ActivityItem({
    required this.title,
    required this.subtitle,
    required this.time,
    required this.participants,
    required this.image,
  });
}

class RoomActivitiesActivitiesList extends StatelessWidget {
  final List<ActivityItem> activities;
  const RoomActivitiesActivitiesList({Key? key, required this.activities})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: activities.length,
      itemBuilder: (context, index) {
        final activity = activities[index];
        return Container(
          margin: EdgeInsets.only(bottom: 1.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              // Activity Image
              Container(
                width: 150.w,
                height: 90.h,
                margin: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF6366F1),
                      Color(0xFF8B5CF6),
                      Color(0xFFEC4899),
                    ],
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: Stack(
                    children: [
                      // Placeholder for concert/game background
                      Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.blue.withOpacity(0.7),
                              Colors.purple.withOpacity(0.9),
                            ],
                          ),
                        ),
                        child: Icon(
                          Icons.music_note,
                          color: Colors.white,
                          size: 30.w,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Activity Details
              Expanded(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 12.h, horizontal: 8.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        activity.title,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        activity.subtitle,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.grey[600],
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            size: 14.w,
                            color: Color(0xFF8B5CF6),
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            activity.time,
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Color(0xFF8B5CF6),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 4.h),
                      Row(
                        children: [
                          Icon(
                            Icons.people,
                            size: 14.w,
                            color: Colors.grey[600],
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            activity.participants,
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
