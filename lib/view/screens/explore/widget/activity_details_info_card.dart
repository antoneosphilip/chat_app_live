import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'user_item_widget.dart';

class ActivityDetailsInfoCard extends StatelessWidget {
  const ActivityDetailsInfoCard({Key? key}) : super(key: key);

  Widget _buildFlag(String flag) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Text(
        flag,
        style: const TextStyle(fontSize: 12),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'PK',
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      const Text(
                        'هلد وغلا بي الجميع',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(width: 8),
                      _buildFlag('🇸🇦'),
                      SizedBox(width: 4.w),
                      _buildFlag('🇸🇦'),
                      SizedBox(width: 4.w),
                      _buildFlag('🇸🇦'),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                children: [
                  const Icon(
                    Icons.calendar_today,
                    color: Colors.blue,
                    size: 20,
                  ),
                  SizedBox(width: 8),
                  const Text(
                    '07-01 01:00',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Spacer(),
                  const Icon(
                    Icons.home,
                    color: Colors.blue,
                    size: 20,
                  ),
                  SizedBox(width: 8),
                  const Text(
                    'Room ID:105731066',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Icon(
                    Icons.chevron_right,
                    color: Colors.grey,
                    size: 20,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                children: [
                  const Icon(
                    Icons.people,
                    color: Colors.blue,
                    size: 20,
                  ),
                  SizedBox(width: 8),
                  const Text(
                    'Enrolled Users (15)',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                children: [
                  UserItemWidget(
                    name: 'Falcon🦅',
                    id: '810048905',
                    avatar:
                        'https://images.unsplash.com/photo-1551993005-75c4131b6bd8?w=80&h=80&fit=crop',
                    badges: ['VIP', '734', '44'],
                    flags: ['🇸🇦', '🇸🇦'],
                    isVip: true,
                  ),
                  UserItemWidget(
                    name: 'جندال🦅',
                    id: '810034637',
                    avatar:
                        'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=80&h=80&fit=crop',
                    badges: ['13', '17'],
                    flags: ['🇪🇬'],
                  ),
                  UserItemWidget(
                    name: 'جوري',
                    id: '810053750',
                    avatar:
                        'https://images.unsplash.com/photo-1494790108755-2616b612b786?w=80&h=80&fit=crop',
                    badges: ['New', '2', '1'],
                    flags: ['🇸🇦', '💛', '🌸', '🇸🇦'],
                    isNew: true,
                  ),
                  UserItemWidget(
                    name: 'SA مها🦅',
                    id: '810050958',
                    avatar:
                        'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=80&h=80&fit=crop',
                    badges: ['18', '4'],
                    flags: ['🇸🇦', '🌸', '🇸🇦'],
                  ),
                  UserItemWidget(
                    name: 'SA سيلا🦅',
                    id: '810042689',
                    avatar:
                        'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=80&h=80&fit=crop',
                    badges: ['11', '10'],
                    flags: ['🌸', '🇪🇬'],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.w),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 50.h,
                      decoration: BoxDecoration(
                        color: Colors.orange.shade100,
                        borderRadius: BorderRadius.circular(25.r),
                      ),
                      child: Icon(
                        Icons.link,
                        color: Colors.orange,
                      ),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    flex: 3,
                    child: Container(
                      height: 50.h,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF00BCD4), Color(0xFF4CAF50)],
                        ),
                        borderRadius: BorderRadius.circular(25.r),
                      ),
                      child: Center(
                        child: Text(
                          'Enroll',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
