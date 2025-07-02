import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'activity_card_widget.dart';

class ExploreActivityCardsList extends StatelessWidget {
  final List<Widget> cards;
  const ExploreActivityCardsList({Key? key, required this.cards})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 175.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        itemCount: cards.length,
        separatorBuilder: (context, index) => SizedBox(width: 10.w),
        itemBuilder: (context, index) => cards[index],
      ),
    );
  }
}
