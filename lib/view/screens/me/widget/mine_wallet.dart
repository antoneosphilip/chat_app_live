import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MineWallet extends StatelessWidget {
  const MineWallet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Wallet Card
          const Expanded(
            flex: 2,
            child: WalletCard(balance: 0),
          ),
          SizedBox(width: 10.w),
          // Column of 2 cards
          Expanded(
            flex: 2,
            child: Column(
              children: [
                // Sada Levels
                Container(
                  height: 55.h,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF7EE8FA), Color(0xFF80FF72)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Sada Levels',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.sp,
                              ),
                            ),
                            Text(
                              'upgrade now',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.8),
                                fontSize: 11.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: Icon(Icons.shield,
                            color: Colors.white, size: 28.sp),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15.h),
                // Medals Wall
                Container(
                  height: 55.h,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFFF9D776), Color(0xFFD7B46A)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Medals Wall',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.sp,
                              ),
                            ),
                            Text(
                              'More details',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.8),
                                fontSize: 11.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: Icon(Icons.emoji_events,
                            color: Colors.white, size: 28.sp),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class WalletCard extends StatelessWidget {
  final int balance;
  const WalletCard({Key? key, this.balance = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFFFE7B2), Color(0xFFF9D776)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(18.r),
        boxShadow: [
          BoxShadow(
            color: Colors.amber.withOpacity(0.08),
            blurRadius: 8,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // الصف العلوي: محفظة - Wallet - هدية
            Row(
              children: [
                Image.network(
                  'https://pngimg.com/uploads/wallet/wallet_PNG77077.png',
                  width: 35.w,
                  height: 35.w,
                ),
                SizedBox(width: 10.w),
                Text(
                  'Wallet',
                  style: TextStyle(
                    color: Colors.brown[900],
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp,
                  ),
                ),
                Spacer(),
                Image.network(
                  'https://pngimg.com/uploads/crown/crown_PNG23846.png',
                  width: 35.w,
                  height: 35.w,
                ),
              ],
            ),
            SizedBox(height: 20.h),
            // المستطيل السفلي
            Container(
              width: double.infinity,
              height: 44.h,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.85),
                borderRadius: BorderRadius.circular(14.r),
              ),
              child: Row(
                children: [
                  SizedBox(width: 12.w),
                  Image.network(
                    'https://pngimg.com/uploads/coin/coin_PNG36907.png',
                    width: 28.w,
                    height: 28.w,
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    '$balance',
                    style: TextStyle(
                      color: Colors.brown[800],
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp,
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.chevron_right,
                      color: Colors.brown[400], size: 28.sp),
                  SizedBox(width: 8.w),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
