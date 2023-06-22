// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class StoryBubble extends StatelessWidget {
  const StoryBubble({
    Key? key,
    required this.name,
    required this.picImages,
    required this.onTap,
  }) : super(key: key);

  final String name;
  final String picImages;
  final onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Column(
        children: [
          // Circle
          GestureDetector(
            onTap: onTap,
            child: Container(
              height: 70,
              width: 70,
              decoration: const BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.circle,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  picImages,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // User name
          const SizedBox(height: 12),
          Text(
            name,
            style: TextStyle(fontSize: 13),
          )
        ],
      ),
    );
  }
}
