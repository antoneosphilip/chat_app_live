import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoinBalanceWidget extends StatelessWidget {
  final int balance;
  final VoidCallback? onAdd;

  const CoinBalanceWidget({Key? key, required this.balance, this.onAdd})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
      decoration: BoxDecoration(
        color: Color(0xFF3B2B7B), // لون بنفسجي غامق أو حسب الخلفية
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(
          color: Color(0xFFFFD700), // ذهبي
          width: 2.5.w,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // أيقونة ذهبية
          Container(
            width: 28.w,
            height: 28.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.amber[400],
              border: Border.all(
                color: Color(0xFFFFD700),
                width: 1.5.w,
              ),
            ),
            child: Center(
              child:
                  Icon(Icons.monetization_on, color: Colors.white, size: 20.sp),
            ),
          ),
          SizedBox(width: 8.w),
          // الرصيد
          Text(
            '$balance',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20.sp,
            ),
          ),
          SizedBox(width: 8.w),
          // زر الإضافة
          GestureDetector(
            onTap: onAdd,
            child: Container(
              width: 28.w,
              height: 28.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.greenAccent[400],
                border: Border.all(
                  color: Color(0xFFFFD700),
                  width: 1.5.w,
                ),
              ),
              child: Center(
                child: Icon(Icons.add, color: Colors.white, size: 20.sp),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
