import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:live_app/view/screens/store/avatar_screen.dart';

class GameStoreScreen extends StatelessWidget {
  final List<Map<String, dynamic>> storeCategories = [
    {'icon': '🚗', 'label': 'Vehicle', 'color': Color(0xFFffa726)},
    {'icon': '👤', 'label': 'Avatar\nFrame', 'color': Color(0xFF42a5f5)},
    {'icon': '🎤', 'label': 'Mic Wave', 'color': Color(0xFF66bb6a)},
    {'icon': '🎯', 'label': 'Entrance\nBanner', 'color': Color(0xFF42a5f5)},
    {'icon': '💬', 'label': 'Bubble', 'color': Color(0xFF00bcd4)},
    {'icon': '👑', 'label': 'Title', 'color': Color(0xFFffa726)},
    {'icon': '🆔', 'label': 'ID', 'color': Color(0xFF66bb6a)},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2B1A0D),
      appBar: AppBar(
        backgroundColor: Color(0xFF2B1A0D),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {},
        ),
        title: Text(
          'Store',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 16),
            child: Row(
              children: [
                Icon(Icons.shopping_bag, color: Color(0xFF00bcd4), size: 20),
                SizedBox(width: 4),
                Text(
                  'Bag',
                  style: TextStyle(color: Color(0xFF00bcd4), fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Category Grid
            GridView.count(
              crossAxisCount: 5,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              mainAxisSpacing: 12,
              crossAxisSpacing: 8,
              childAspectRatio: 0.7,
              children: storeCategories
                  .map((cat) => StoreCategoryItem(
                        icon: cat['icon'],
                        label: cat['label'],
                        color: cat['color'],
                      ))
                  .toList(),
            ),
            SizedBox(height: 30),

            // Hot Section
            _buildSectionHeader('🔥 Hot', 'More >'),
            SizedBox(height: 16),

            // Hot Items Grid
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 6,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 12,
                crossAxisSpacing: 1,
                childAspectRatio: 0.6,
              ),
              itemBuilder: (context, i) => _buildLuxuryItem(
                'King of luxury',
                '24,333',
                Icons.auto_awesome,
                [Colors.yellow, Colors.orange],
              ),
            ),

            SizedBox(height: 30),
            // Event Section
            _buildSectionHeader('⭐ Event', 'More >'),
            SizedBox(height: 16),

            // Event
            // Hot Items Grid
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 6,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 12,
                crossAxisSpacing: 2,
                childAspectRatio: 0.6,
              ),
              itemBuilder: (context, i) => _buildLuxuryItem(
                'King of luxury',
                '24,333',
                Icons.auto_awesome,
                [Colors.yellow, Colors.orange],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        decoration: BoxDecoration(
          color: Color(0xFF5B3A1A),
          border: Border(
            top: BorderSide(color: Colors.brown.shade700, width: 1),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.monetization_on, color: Colors.amber, size: 28),
            SizedBox(width: 2),
            Icon(Icons.diamond, color: Colors.lightBlueAccent, size: 20),
            SizedBox(width: 6),
            Text(
              '0',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(width: 8),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF3A2412),
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: Colors.amber, width: 1.2),
              ),
              padding: EdgeInsets.all(4),
              child: Icon(Icons.add, color: Colors.amber, size: 22),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryIcon(String emoji, String label, Color bgColor) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: bgColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: bgColor.withOpacity(0.3)),
          ),
          child: Center(
            child: Text(
              emoji,
              style: TextStyle(fontSize: 24),
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            color: Colors.white70,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildSectionHeader(String title, String action) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          action,
          style: TextStyle(
            color: Color(0xFF00bcd4),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildHotItem(String title, String price, String imagePath,
      List<Color> gradientColors) {
    return Container(
      width: 140,
      margin: EdgeInsets.only(right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                colors: gradientColors,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Center(
              child: Icon(
                Icons.directions_car,
                size: 50,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 4),
          Row(
            children: [
              Icon(Icons.monetization_on, color: Colors.yellow, size: 16),
              SizedBox(width: 4),
              Text(
                price,
                style: TextStyle(
                  color: Colors.yellow,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLuxuryItem(
      String title, String price, IconData icon, List<Color> gradientColors) {
    return Container(
      width: 160.w,
      margin: EdgeInsets.only(right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                colors: gradientColors,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Stack(
              children: [
                Center(
                  child: Icon(
                    icon,
                    size: 60,
                    color: Colors.white,
                  ),
                ),
                if (title == 'King of luxury')
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Icon(
                      Icons.auto_awesome,
                      color: Colors.yellow,
                      size: 20,
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 4),
          Row(
            children: [
              Icon(Icons.monetization_on, color: Colors.yellow, size: 16),
              SizedBox(width: 4),
              Text(
                price,
                style: TextStyle(
                  color: Colors.yellow,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEventBanner(String title, Color color, String price) {
    return Container(
      width: 120,
      margin: EdgeInsets.only(right: 12),
      child: Column(
        children: [
          Container(
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: color.withOpacity(0.3),
              border: Border.all(color: color),
            ),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: LinearGradient(
                      colors: [color.withOpacity(0.6), color.withOpacity(0.2)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 8,
                  right: 8,
                  child: Icon(
                    Icons.auto_awesome,
                    color: Colors.yellow,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              color: Colors.white70,
              fontSize: 10,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          if (price.isNotEmpty)
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.monetization_on, color: Colors.yellow, size: 12),
                Icon(Icons.diamond, color: Colors.blue, size: 12),
                SizedBox(width: 2),
                Text(
                  price,
                  style: TextStyle(
                    color: Colors.yellow,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 4),
                Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: Icon(
                    Icons.add,
                    size: 12,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class StoreCategoryItem extends StatelessWidget {
  final String icon;
  final String label;
  final Color color;

  const StoreCategoryItem({
    Key? key,
    required this.icon,
    required this.label,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => AvatarFramePage());
      },
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: color.withOpacity(0.15),
            radius: 24,
            child: Text(
              icon,
              style: TextStyle(fontSize: 28),
            ),
          ),
          SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(color: Colors.white, fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class AvatarFrameCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // الخلفية الدائرية مع الصور الرمزية
        Container(
          width: double.infinity,
          height: 270,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.7),
            borderRadius: BorderRadius.circular(24),
            image: DecorationImage(
              image: AssetImage(
                  'assets/bg_avatar_frame.png'), // ضع صورة الخلفية هنا أو احذفها إذا غير متوفرة
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5),
                BlendMode.darken,
              ),
            ),
          ),
        ),
        // الإطار والحرف في المنتصف
        Align(
          alignment: Alignment(0, -0.3),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                'assets/frames/king_of_luxury.png', // صورة الإطار
                width: 160,
                height: 160,
              ),
              CircleAvatar(
                radius: 55,
                backgroundColor: Colors.green,
                child: Text(
                  'A',
                  style: TextStyle(
                    fontSize: 60,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        // اسم الإطار وزر الشراء في الأسفل
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.7),
                  Colors.transparent,
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'King of luxury',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        'King of luxury',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF1DE9B6), // لون الزر
                    shape: StadiumBorder(),
                    padding: EdgeInsets.symmetric(horizontal: 28, vertical: 12),
                  ),
                  child: Text(
                    'Buy',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
