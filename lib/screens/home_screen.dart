import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  // Icons used in the primary TabBar under the AppBar
  final List<IconData> _tabIcons = const [
    Icons.home,
    Icons.ondemand_video,
    Icons.storefront,
    Icons.account_circle_outlined,
    Icons.notifications,
  ];

  @override
  void initState() {
    super.initState();
    // 6 tabs: 5 icons + 1 profile-avatar tab
    _tabController = TabController(length: 6, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 16,
        title: Image.asset(
          'assets/images/facebook_appbar_wordmark.png',
          width: 120,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_circle, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.chat, color: Colors.black), // أيقونة الماسنجر بدلاً من لوجو الفيس
            onPressed: () {},
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(44),
          child: TabBar(
            controller: _tabController,
            indicatorColor: const Color(0xFF1877F2),
            labelColor: const Color(0xFF1877F2),
            unselectedLabelColor: const Color(0xFF898F9C),
            tabs: [
              ..._tabIcons.map((icon) => Tab(icon: Icon(icon))),
              const Tab(
                icon: CircleAvatar(
                  radius: 12,
                  backgroundImage:
                  AssetImage('assets/images/story_2_messi.png'),
                ),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          const _PostCreationBar(),
          const Divider(height: 1),
          const SizedBox(height: 8),
          const _StoriesList(),
          const SizedBox(height: 8),
          const Divider(height: 1),
          const _PostCard(),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// "What's in Your Mind?" post creation bar
// ---------------------------------------------------------------------------
class _PostCreationBar extends StatelessWidget {
  const _PostCreationBar();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage('assets/images/story_2_messi.png'),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFFF0F2F5),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                "What's in Your Mind?",
                style: TextStyle(color: Color(0xFF898F9C), fontSize: 16),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Colors.transparent,
            ),
            child: const Icon(Icons.image, color: Colors.green, size: 26),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Horizontal stories list (height 220): Create Story + View Story items
// ---------------------------------------------------------------------------
class _StoriesList extends StatelessWidget {
  const _StoriesList();

  static const List<String> _storyImages = [
    'assets/images/story_2_messi.png',
    'assets/images/story_1.png',
    'assets/images/story_3_player.png',
    'assets/images/story_4_gradient.png',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: _storyImages.length + 1, // +1 for "Create a Story"
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          if (index == 0) {
            return _CreateStoryCard(imagePath: _storyImages[0]);
          }
          return _StoryCard(imagePath: _storyImages[index - 1]);
        },
      ),
    );
  }
}

class _CreateStoryCard extends StatelessWidget {
  final String imagePath;
  const _CreateStoryCard({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 110,
        color: Colors.grey.shade200,
        child: Stack(
          fit: StackFit.expand,
          children: [
            // top image portion
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: 170,
              child: Image.asset(imagePath, fit: BoxFit.cover),
            ),
            // bottom white label area
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              height: 50,
              child: Container(
                color: Colors.white,
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.only(bottom: 6),
                child: const Text(
                  'Create a\nStory',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            // blue "+" button straddling the divide
            Positioned(
              bottom: 34,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  width: 28,
                  height: 28,
                  decoration: const BoxDecoration(
                    color: Color(0xFF1877F2),
                    shape: BoxShape.circle,
                    border: Border.fromBorderSide(
                      BorderSide(color: Colors.white, width: 2),
                    ),
                  ),
                  child: const Icon(Icons.add, color: Colors.white, size: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StoryCard extends StatelessWidget {
  final String imagePath;
  const _StoryCard({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 110,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(imagePath, fit: BoxFit.cover),
            // subtle bottom gradient so future name/text stays readable
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              height: 40,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0),
                      Colors.black.withOpacity(0.5),
                    ],
                  ),
                ),
              ),
            ),
            // circular avatar top-left
            const Positioned(
              top: 8,
              left: 8,
              child: CircleAvatar(
                radius: 14,
                backgroundColor: Color(0xFF1877F2),
                child: CircleAvatar(
                  radius: 12,
                  backgroundImage:
                  AssetImage('assets/images/story_2_messi.png'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Post card
// ---------------------------------------------------------------------------
class _PostCard extends StatelessWidget {
  const _PostCard();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Post header: avatar, name, timestamp + globe icon, more menu
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
          child: Row(
            children: [
              const CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/images/route_avatar.png'),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Route',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color(0xFF242527),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Row(
                      children: const [
                        Text(
                          '8h',
                          style: TextStyle(
                            color: Color(0xFF898F9C),
                            fontSize: 13,
                          ),
                        ),
                        SizedBox(width: 4),
                        Icon(Icons.public, size: 13, color: Color(0xFF898F9C)),
                      ],
                    ),
                  ],
                ),
              ),
              const Icon(Icons.more_horiz, color: Colors.black),
            ],
          ),
        ),

        // Post image
        Image.asset(
          'assets/images/route_post_image.png',
          width: double.infinity,
          fit: BoxFit.fitWidth,
        ),

        // Action row: like, comment, share
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              const Icon(Icons.favorite_border, size: 24, color: Color(0xFF898F9C)),
              const SizedBox(width: 20),
              const Icon(Icons.chat_bubble_outline, size: 24, color: Color(0xFF898F9C)),
              const SizedBox(width: 20),
              const Icon(Icons.send_outlined, size: 24, color: Color(0xFF898F9C)),
              const Spacer(),
              const Icon(Icons.bookmark_border, size: 24, color: Color(0xFF898F9C)),
            ],
          ),
        ),
      ],
    );
  }
}
