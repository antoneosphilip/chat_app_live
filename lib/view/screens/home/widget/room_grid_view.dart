import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:live_app/controller/home_controller.dart';
import 'package:live_app/view/base/room/top_rooms/square_top_rooms_item.dart';

class RoomGridView extends StatelessWidget {
  final HomeController homeController;
  const RoomGridView({super.key, required this.homeController});

  @override
  Widget build(BuildContext context) {
    return   Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                    child: GridView.builder(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(), // لو داخل ScrollView
                                      padding: EdgeInsets.zero,
                                      itemCount: homeController.staticRoomGridVieWBottom.length,
                                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,           // عدد الأعمدة
                                        mainAxisSpacing: 8.0,        // المسافة العمودية بين العناصر
                                        crossAxisSpacing: 8.0,     
                                          // المسافة الأفقية بين العناصر
                                        childAspectRatio: 1, 
                                             // لأنك عايز العنصر يكون مربع (width == height)
                                      ),
                                      itemBuilder: (context, index) {
                                        return Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: SquareTopRoomsItem(
                                                room: homeController.staticRoomGridVieWBottom[index],
                                                no: '${index + 1}',
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Image(image:NetworkImage('https://th.bing.com/th/id/OIP.4ve4zACsz1LZOlMcCUHGBAHaE8?rs=1&pid=ImgDetMain'),width: 12.w,height: 12.h,),
                                                SizedBox(width: 4.w,),
                                                Text("وكالة",style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.bold),),
                                              ],
                                            )
                                          ],
                                        );
                                      },
                                    ),
                                  );
  }

}