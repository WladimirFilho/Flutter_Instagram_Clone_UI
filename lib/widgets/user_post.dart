// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class UserPost extends StatelessWidget {
  const UserPost({
    Key? key,
    required this.userName,
    required this.imagePath,
    required this.profilePic,
  }) : super(key: key);

  final String userName;
  final String imagePath;
  final String profilePic;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        children: [
          // User details on Feed
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    // Picture
                    Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                        color: Colors.amberAccent,
                        shape: BoxShape.circle,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          profilePic,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    const SizedBox(width: 10),

                    // User name
                    Text(
                      userName,
                      style: const TextStyle(
                        letterSpacing: -0.2,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),

                // More Options Section
                const Icon(Icons.more_horiz_rounded),
              ],
            ),
          ),

          // Post
          SizedBox(
            height: 350,
            width: double.infinity,
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),

          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 90,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        Icons.favorite_border_outlined,
                        size: 25,
                      ),
                      Icon(Icons.chat_bubble_outline, size: 25),
                      Icon(Icons.share, size: 25),
                    ],
                  ),
                ),
                Icon(Icons.bookmark_outline, size: 25),
              ],
            ),
          ),

          // Like By
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Row(
              children: [
                Text('Like By...'),
                Text(
                  'tonymontana',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
