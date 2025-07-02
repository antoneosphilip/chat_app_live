import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserItemWidget extends StatelessWidget {
  final String name;
  final String id;
  final String avatar;
  final List<String> badges;
  final List<String> flags;
  final bool isVip;
  final bool isNew;

  const UserItemWidget({
    Key? key,
    required this.name,
    required this.id,
    required this.avatar,
    required this.badges,
    required this.flags,
    this.isVip = false,
    this.isNew = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          // Avatar with Golden Border for VIP
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border:
                  isVip ? Border.all(color: Colors.amber, width: 3.w) : null,
            ),
            child: CircleAvatar(
              radius: 25.w,
              backgroundImage: NetworkImage(avatar),
            ),
          ),
          SizedBox(width: 12.w),
          // User Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    ...flags.map((flag) => Padding(
                          padding: EdgeInsets.only(right: 4.w),
                          child: Text(flag, style: TextStyle(fontSize: 14.sp)),
                        )),
                  ],
                ),
                SizedBox(height: 4.h),
                Text(
                  'ID: $id',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey.shade600,
                  ),
                ),
                SizedBox(height: 8.h),
                Row(
                  children: badges.map((badge) {
                    Color badgeColor;
                    if (badge == 'VIP') {
                      badgeColor = Colors.purple;
                    } else if (badge == 'New') {
                      badgeColor = Colors.green;
                    } else if (int.tryParse(badge) != null) {
                      badgeColor = Colors.orange;
                    } else {
                      badgeColor = Colors.blue;
                    }
                    return Container(
                      margin: EdgeInsets.only(right: 6.w),
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                      decoration: BoxDecoration(
                        color: badgeColor.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(color: badgeColor, width: 1),
                      ),
                      child: Text(
                        badge,
                        style: TextStyle(
                          color: badgeColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
