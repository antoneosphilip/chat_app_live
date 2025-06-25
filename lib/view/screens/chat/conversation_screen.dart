import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:live_app/controller/auth_controller.dart';
import 'package:live_app/controller/chat_controller.dart';
import 'package:live_app/controller/localization_controller.dart';
import 'package:live_app/controller/user_controller.dart';
import 'package:live_app/data/model/body/notification_body.dart';
import 'package:live_app/data/model/response/conversation_model.dart';
import 'package:live_app/helper/date_converter.dart';
import 'package:live_app/helper/responsive_helper.dart';
import 'package:live_app/helper/route_helper.dart';
import 'package:live_app/util/app_constants.dart';
import 'package:live_app/util/dimensions.dart';
import 'package:live_app/util/styles.dart';
import 'package:live_app/view/base/custom_app_bar.dart';
import 'package:live_app/view/base/custom_image.dart';
import 'package:live_app/view/base/custom_ink_well.dart';
import 'package:live_app/view/base/custom_snackbar.dart';
import 'package:live_app/view/base/paginated_list_view.dart';
import 'package:live_app/view/screens/chat/widget/conversation_screen_chat_item.dart';
import 'package:live_app/view/screens/chat/widget/custom_tab_bar_chat.dart';
import 'package:live_app/view/screens/chat/widget/tab_bar_chat_screen.dart';
import 'package:live_app/view/screens/home/home_screen.dart';
import 'package:live_app/view/screens/search/widget/search_field.dart';

class ConversationScreen extends StatefulWidget {
  final bool fromNavBar;
  const ConversationScreen({Key? key, this.fromNavBar = false})
      : super(key: key);

  @override
  State<ConversationScreen> createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen>
    with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  late TabController _tabController;
  int selectedTabIndex = 0;

  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    // initCall();
  }

  void _onTabChanged(int index) {
    setState(() {
      selectedTabIndex = index;
    });
    _tabController?.animateTo(index);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void initCall() {
    if (Get.find<AuthController>().isLoggedIn()) {
      Get.find<UserController>().getUserInfo();
      Get.find<ChatController>().getConversationList(1,
          type: ResponsiveHelper.isDesktop(Get.context) ? 'vendor' : '');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatController>(builder: (chatController) {
      ConversationsModel? conversation;
      if (chatController.searchConversationModel != null) {
        conversation = chatController.searchConversationModel;
      } else {
        conversation = chatController.conversationsModelStatic;
      }

      return Scaffold(
        appBar: CustomAppBarWithTabs(
          tabBarwidget: RealTabBarChatWidget(
            onTabChanged: _onTabChanged,
            initialIndex: selectedTabIndex,
          ),
        ),
        body: Container(
          child: SafeArea(
            child: Column(
              children: [
                // Header with decorative animals
                // Content
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFF5F5F5),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        MessagesTab(),
                        FriendsTab(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

class MessagesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          // Sada news
          MessageItem(
            icon: Icons.newspaper,
            iconColor: Color(0xFF2196F3),
            title: 'Sada news',
            subtitle: 'نبذة',
            time: '06/23 04:42',
            hasNotification: true,
            iconBackground: Color(0xFFE3F2FD),
          ),
          SizedBox(height: 1.h),
          // Sada System
          MessageItem(
            icon: Icons.notifications,
            iconColor: Color(0xFF2196F3),
            title: 'Sada System',
            subtitle: '',
            time: '',
            hasNotification: false,
            iconBackground: Color(0xFFE3F2FD),
          ),
          SizedBox(height: 1.h),
          // Sada Contact us
          MessageItem(
            icon: Icons.headset_mic,
            iconColor: Color(0xFF2196F3),
            title: 'Sada Contact us',
            subtitle: '',
            time: '',
            hasNotification: false,
            iconBackground: Color(0xFFE3F2FD),
          ),
        ],
      ),
    );
  }
}

class MessageItem extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color iconBackground;
  final String title;
  final String subtitle;
  final String time;
  final bool hasNotification;

  const MessageItem({
    Key? key,
    required this.icon,
    required this.iconColor,
    required this.iconBackground,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.hasNotification,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Icon
          Container(
            width: 60.w,
            height: 60.h,
            decoration: BoxDecoration(
              color: iconBackground,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: 24,
            ),
          ),
          SizedBox(width: 12.w),
          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    // Crown icon
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Icon(
                        Icons.emoji_events,
                        color: Colors.white,
                        size: 12,
                      ),
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        if (time.isNotEmpty)
                          Text(
                            time,
                            style: TextStyle(
                              fontSize: 13.sp,
                              color: Colors.grey[500],
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
                if (subtitle.isNotEmpty)
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 2),
                        child: Text(
                          subtitle,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                      Spacer(),
                      if (hasNotification)
                        Container(
                          width: 15.w,
                          height: 15.h,
                          decoration: const BoxDecoration(
                            color: Colors.pinkAccent,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              '1',
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
              ],
            ),
          ),
          // Time and notification
        ],
      ),
    );
  }
}

class FriendsTab extends StatefulWidget {
  @override
  _FriendsTabState createState() => _FriendsTabState();
}

class _FriendsTabState extends State<FriendsTab>
    with SingleTickerProviderStateMixin {
  late TabController _friendsTabController;

  @override
  void initState() {
    super.initState();
    _friendsTabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _friendsTabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Friends sub-tabs
        Container(
          color: Color(0xFFF5F5F5),
          child: TabBar(
            controller: _friendsTabController,
            tabs: const [
              Tab(text: 'Friends'),
              Tab(text: 'Following'),
              Tab(text: 'Followers'),
            ],
            labelColor: Colors.black87,
            unselectedLabelColor: Colors.grey[600],
            indicatorColor: Colors.black,
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(width: 2.0, color: Colors.black),
              insets: EdgeInsets.symmetric(
                  horizontal: 45.0.w), // <-- قَصِّر الشرطة هنا
            ),
            indicatorWeight: 1,
            labelStyle: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
            unselectedLabelStyle: TextStyle(
              fontSize: 14.sp,
            ),
          ),
        ),
        // Content
        Expanded(
          child: TabBarView(
            controller: _friendsTabController,
            children: [
              EmptyFriendsView(),
              EmptyFriendsView(),
              EmptyFriendsView(),
            ],
          ),
        ),
      ],
    );
  }
}

class EmptyFriendsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Empty state illustration
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Stack(
                children: [
                  Container(
                    width: 80,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 10,
                    child: Container(
                      width: 60,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 20,
                    child: Container(
                      width: 40,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 24),
          Text(
            'No more information',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
