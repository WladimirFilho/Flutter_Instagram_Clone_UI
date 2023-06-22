import 'package:flutter/material.dart';
import 'package:social_media_app/pages/story_page.dart';
import 'package:social_media_app/widgets/story_bubble.dart';
import 'package:social_media_app/widgets/user_post.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

// user posts list
final List userPost = [
  // [ username, post image, profile image  ]
  ['jonnymackein', 'lib/images/post1.png', 'lib/images/user1.png'],
  ['nurianossabeih', 'lib/images/post2.png', 'lib/images/user2.png'],
  ['mariamara', 'lib/images/post3.png', 'lib/images/user3.png'],
];

// Stories List
final List bubbleStoriesList = [
  // [ username, post image ]
  ['jonymackein', 'lib/images/user1.png'],
  ['nurianossa', 'lib/images/user2.png'],
  ['mariamara', 'lib/images/user3.png'],
  ['janemarry', 'lib/images/user4.png'],
  ['jonnymackein', 'lib/images/user1.png'],
  ['nurianossabeih', 'lib/images/user2.png'],
  ['mariamara', 'lib/images/user3.png'],
  ['janemarry', 'lib/images/user4.png'],
];

int _currentIndex = 0;

class _HomePageState extends State<HomePage> {
// Function to open Story Page
  void _openStory() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const StoryPage();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            // Instagram heading + buttons on the right
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Instagram heading
                  Text(
                    'Instagram',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),

                  // Buttons
                  Row(
                    children: [
                      Icon(Icons.add_box_outlined),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.0),
                        child: Icon(Icons.favorite_border),
                      ),
                      Icon(Icons.chat_bubble_outline),
                    ],
                  )
                ],
              ),
            ),

            const SizedBox(height: 25),

            // Stories
            SizedBox(
              height: 110,
              child: ListView.builder(
                itemCount: bubbleStoriesList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final userName = bubbleStoriesList[index][0];
                  final imagePath = bubbleStoriesList[index][1];
                  return StoryBubble(
                    name: userName,
                    picImages: imagePath,
                    onTap: _openStory,
                  );
                },
              ),
            ),
            const SizedBox(height: 25),

            // Feed
            SingleChildScrollView(
              child: ListView.builder(
                physics: const ClampingScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: userPost.length,
                itemBuilder: (context, index) {
                  final userName = userPost[index][0];
                  final imagePath = userPost[index][1];
                  final profilePic = userPost[index][2];
                  return UserPost(
                    imagePath: imagePath,
                    userName: userName,
                    profilePic: profilePic,
                  );
                },
              ),
            ),
          ],
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.black,
        selectedItemColor: const Color.fromARGB(255, 34, 134, 216),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_collection_outlined),
            label: 'video',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shop),
            label: 'shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'account',
          ),
        ],
      ),
    );
  }
}
