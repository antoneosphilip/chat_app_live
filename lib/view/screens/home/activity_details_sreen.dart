import 'package:flutter/material.dart';

class ActivityDetailsScreen extends StatelessWidget {
  const ActivityDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Gradient background covers the whole screen
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF8F5CFF), // Purple
                  Color(0xFF6FE7FF), // Light Blue
                  Colors.white, // White at the bottom
                ],
                stops: [0.0, 0.35, 1.0],
              ),
            ),
          ),
          // Main content
          SafeArea(
            child: Column(
              children: [
                // Header
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                      const Expanded(
                        child: Text(
                          'Activity Details',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(width: 40), // Balance the back button
                    ],
                  ),
                ),

                // Bird Image Card
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: const DecorationImage(
                      image: NetworkImage(
                        'https://images.unsplash.com/photo-1551993005-75c4131b6bd8?w=400&h=200&fit=crop',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Content Card
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // PK Title and Arabic Text
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'PK',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  const Text(
                                    'هلد وغلا بي الجميع',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black54,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  _buildFlag('🇸🇦'),
                                  const SizedBox(width: 4),
                                  _buildFlag('🇸🇦'),
                                  const SizedBox(width: 4),
                                  _buildFlag('🇸🇦'),
                                ],
                              ),
                            ],
                          ),
                        ),

                        // Date and Room ID
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.calendar_today,
                                color: Colors.blue,
                                size: 20,
                              ),
                              const SizedBox(width: 8),
                              const Text(
                                '07-01 01:00',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.home,
                                color: Colors.blue,
                                size: 20,
                              ),
                              const SizedBox(width: 8),
                              const Text(
                                'Room ID:105731066',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const Icon(
                                Icons.chevron_right,
                                color: Colors.grey,
                                size: 20,
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 20),

                        // Enrolled Users Section
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.people,
                                color: Colors.blue,
                                size: 20,
                              ),
                              const SizedBox(width: 8),
                              const Text(
                                'Enrolled Users (15)',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 16),

                        // Users List
                        Expanded(
                          child: ListView(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            children: [
                              _buildUserItem(
                                name: 'Falcon🦅',
                                id: '810048905',
                                avatar:
                                    'https://images.unsplash.com/photo-1551993005-75c4131b6bd8?w=80&h=80&fit=crop',
                                badges: ['VIP', '734', '44'],
                                flags: ['🇸🇦', '🇸🇦'],
                                isVip: true,
                              ),
                              _buildUserItem(
                                name: 'جندال🦅',
                                id: '810034637',
                                avatar:
                                    'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=80&h=80&fit=crop',
                                badges: ['13', '17'],
                                flags: ['🇪🇬'],
                              ),
                              _buildUserItem(
                                name: 'جوري',
                                id: '810053750',
                                avatar:
                                    'https://images.unsplash.com/photo-1494790108755-2616b612b786?w=80&h=80&fit=crop',
                                badges: ['New', '2', '1'],
                                flags: ['🇸🇦', '💛', '🌸', '🇸🇦'],
                                isNew: true,
                              ),
                              _buildUserItem(
                                name: 'SA مها🦅',
                                id: '810050958',
                                avatar:
                                    'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=80&h=80&fit=crop',
                                badges: ['18', '4'],
                                flags: ['🇸🇦', '🌸', '🇸🇦'],
                              ),
                              _buildUserItem(
                                name: 'SA سيلا🦅',
                                id: '810042689',
                                avatar:
                                    'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=80&h=80&fit=crop',
                                badges: ['11', '10'],
                                flags: ['🌸', '🇪🇬'],
                              ),
                            ],
                          ),
                        ),

                        // Bottom Buttons
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.orange.shade100,
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: const Icon(
                                    Icons.link,
                                    color: Colors.orange,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                flex: 3,
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color(0xFF00BCD4),
                                        Color(0xFF4CAF50)
                                      ],
                                    ),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'Enroll',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFlag(String flag) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        flag,
        style: const TextStyle(fontSize: 12),
      ),
    );
  }

  Widget _buildUserItem({
    required String name,
    required String id,
    required String avatar,
    required List<String> badges,
    required List<String> flags,
    bool isVip = false,
    bool isNew = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // Avatar with Golden Border for VIP
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: isVip ? Border.all(color: Colors.amber, width: 3) : null,
            ),
            child: CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(avatar),
            ),
          ),

          const SizedBox(width: 12),

          // User Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(width: 8),
                    ...flags.map((flag) => Padding(
                          padding: const EdgeInsets.only(right: 4),
                          child:
                              Text(flag, style: const TextStyle(fontSize: 14)),
                        )),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  'ID: $id',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(height: 8),
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
                      margin: const EdgeInsets.only(right: 6),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: badgeColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        badge,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),

          // Crown icon for special users
          if (isVip || isNew)
            Icon(
              isVip ? Icons.star : Icons.favorite,
              color: isVip ? Colors.amber : Colors.red,
              size: 20,
            ),
        ],
      ),
    );
  }
}
