import 'package:flutter/material.dart';

class UserPost extends StatelessWidget {
  const UserPost({
    required this.imagePath,
    required this.userName,
    super.key,
  });

  final String userName;
  final String imagePath;

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
            height: 400,
            child: Image.asset(imagePath),
          ),

          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.favorite_border_outlined,
                      size: 32,
                    ),
                    Icon(Icons.chat_bubble_outline, size: 32),
                    Icon(Icons.share, size: 32),
                  ],
                ),
                Icon(Icons.bookmark_outline, size: 32),
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
