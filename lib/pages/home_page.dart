import 'package:flutter/material.dart';
import 'package:social_media_app/widgets/story_bubble.dart';
import 'package:social_media_app/widgets/user_post.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  StoryBubble(name: 'John'),
                  StoryBubble(name: 'Wlad'),
                  StoryBubble(name: 'Taylor'),
                  StoryBubble(name: 'John'),
                  StoryBubble(name: 'Wlad'),
                  StoryBubble(name: 'Taylor'),
                ],
              ),
            ),
            const SizedBox(height: 25),

            // Feed
            const UserPost(
              userName: 'mitchkoko',
            ),
            const UserPost(
              userName: 'nurianossabeih',
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.grey[700],
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
