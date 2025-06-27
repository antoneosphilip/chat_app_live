import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateRoomBottomSheet extends StatefulWidget {
  const CreateRoomBottomSheet({Key? key}) : super(key: key);

  @override
  State<CreateRoomBottomSheet> createState() => _CreateRoomBottomSheetState();
}

class _CreateRoomBottomSheetState extends State<CreateRoomBottomSheet> {
  String selectedRoomType = 'Voice Party';

  static void show(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFF5F5F0),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFFFF3D6), Colors.white],
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Gradient header
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(
                  left: 24.w, right: 24.w, top: 24.h, bottom: 12.h),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(Icons.close,
                            color: Colors.black87, size: 28),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    'Create your room',
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    'Invite your friends to have fun together',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.03),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Text(
                      'Antoneos Philip',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: _buildRoomTypeCard(
                          iconData: Icons.favorite_border,
                          title: 'Friends',
                          isSelected: selectedRoomType == 'Friends',
                          color: const Color(0xFF7986CB),
                          onTap: () =>
                              setState(() => selectedRoomType = 'Friends'),
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: _buildRoomTypeCard(
                          iconData: Icons.favorite_border,
                          title: 'Friends',
                          isSelected: selectedRoomType == 'Friends2',
                          color: const Color(0xFF7986CB),
                          onTap: () =>
                              setState(() => selectedRoomType = 'Friends2'),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 14.h),
                  Row(
                    children: [
                      Expanded(
                        child: _buildRoomTypeCard(
                          iconData: Icons.favorite_border,
                          title: 'Friends',
                          isSelected: selectedRoomType == 'Friends3',
                          color: const Color(0xFF7986CB),
                          onTap: () =>
                              setState(() => selectedRoomType = 'Friends3'),
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: _buildRoomTypeCard(
                          iconData: Icons.favorite_border,
                          title: 'Friends',
                          isSelected: selectedRoomType == 'Friends4',
                          color: const Color(0xFF7986CB),
                          onTap: () =>
                              setState(() => selectedRoomType = 'Friends4'),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 32.h),
                  Container(
                    width: double.infinity,
                    height: 56.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.r),
                      gradient: const LinearGradient(
                        colors: [Color(0xFF1DD6C1), Color(0xFF4ECDF4)],
                      ),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(30.r),
                        onTap: () {
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content:
                                  Text('Creating $selectedRoomType room...'),
                              backgroundColor: const Color(0xFF4ECDC4),
                            ),
                          );
                        },
                        child: Center(
                          child: Text(
                            'Explore Now',
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRoomTypeCard({
    required IconData iconData,
    required String title,
    required bool isSelected,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 10.w),
        decoration: BoxDecoration(
          color: isSelected ? color.withOpacity(0.10) : const Color(0xFFF8F8F8),
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(
            color: isSelected ? color : const Color(0xFFE0E0E0),
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 14,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(
              iconData,
              color: color,
              size: 32.w,
            ),
            SizedBox(width: 10.w),
            Text(
              title,
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
                color: isSelected ? color : Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
