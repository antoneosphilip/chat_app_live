import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AvatarFramePage extends StatelessWidget {
  final List<Map<String, dynamic>> frames = [
    {"title": "King of luxury", "price": "24,333", "icon": Icons.emoji_events},
    {
      "title": "Suzaku",
      "price": "100,000",
      "icon": Icons.local_fire_department
    },
    {"title": "أرجواني", "price": "50,000", "icon": Icons.auto_awesome},
    {"title": "صيف منعش", "price": "50,000", "icon": Icons.wb_sunny},
    {"title": "بطيخ", "price": "50,000", "icon": Icons.local_drink},
    {"title": "KTV", "price": "10,000", "icon": Icons.music_note},
    {"title": "إطار 7", "price": "50,000", "icon": Icons.ac_unit},
    {"title": "إطار 8", "price": "50,000", "icon": Icons.sports_basketball},
    {"title": "إطار 9", "price": "50,000", "icon": Icons.cake},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1B1B1B),
      appBar: AppBar(
        backgroundColor: Color(0xFF1B1B1B),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {},
        ),
        title: Text(
          "Avatar Frame",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_bag_outlined, color: Colors.white),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          // Avatar Preview
          Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.teal,
                  child: Icon(
                    Icons.emoji_events,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "King of luxury",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            "King of luxury",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w100),
                          ),
                        ],
                      ),
                      Spacer(),
                      Container(
                        width: 80.w,
                        height: 40.h,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text("Buy"),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.teal,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 20),
          // Tabs
          DefaultTabController(
            length: 2,
            child: Column(
              children: [
                TabBar(
                  indicatorColor: Colors.teal,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.grey,
                  indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(
                      width: 2.0, // السماكة
                      color: Colors.teal,
                    ),
                    insets: EdgeInsets.symmetric(
                        horizontal: 75.0.w), // تصغير الطول من الجانبين
                  ),
                  tabs: [
                    Tab(text: "Popular"),
                    Tab(text: "Activity"),
                  ],
                ),
                Container(
                  height: 360,
                  child: TabBarView(
                    children: [
                      // Popular Grid
                      GridView.builder(
                        padding: EdgeInsets.all(10),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 0.65, // أعرض وأطول شوية
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemCount: frames.length,
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: double.infinity,
                                height: 120,
                                decoration: BoxDecoration(
                                  color: Color(0xFF252525),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Center(
                                  child: Icon(
                                    frames[index]["icon"],
                                    size: 40,
                                    color: Colors.tealAccent,
                                  ),
                                ),
                              ),
                              SizedBox(height: 6),
                              Text(
                                frames[index]["title"],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                              SizedBox(height: 4),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.monetization_on,
                                      size: 14, color: Colors.amber),
                                  SizedBox(width: 3),
                                  Text(
                                    frames[index]["price"],
                                    style: TextStyle(
                                        color: Colors.amber, fontSize: 12),
                                  )
                                ],
                              ),
                            ],
                          );
                        },
                      ),

                      Center(
                        child: Text(
                          "No activity yet",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
