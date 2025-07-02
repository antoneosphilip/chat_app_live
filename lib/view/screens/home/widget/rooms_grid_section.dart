import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:live_app/view/base/room/top_rooms/square_top_rooms_item.dart';

class RoomsGridSection extends StatelessWidget {
  final dynamic homeController;
  const RoomsGridSection({Key? key, required this.homeController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: homeController.staticRoomGrid.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8.0.h,
          crossAxisSpacing: 8.0.w,
          childAspectRatio: 1,
        ),
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SquareTopRoomsItem(
                  room: homeController.staticRoomGrid[index],
                  no: '${index + 1}',
                ),
              ),
              Row(
                children: [
                  Image(
                    image: const NetworkImage(
                        'https://th.bing.com/th/id/OIP.4ve4zACsz1LZOlMcCUHGBAHaE8?rs=1&pid=ImgDetMain'),
                    width: 12.w,
                    height: 12.h,
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    "وكالة",
                    style:
                        TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
