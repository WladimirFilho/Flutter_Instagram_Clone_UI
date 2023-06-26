import 'dart:async';

import 'package:flutter/material.dart';
import 'package:social_media_app/stories/story_1.dart';
import 'package:social_media_app/stories/story_2.dart';
import 'package:social_media_app/stories/story_3.dart';
import 'package:social_media_app/widgets/story_bars.dart';

class StoryPage extends StatefulWidget {
  const StoryPage({super.key});

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  final List myStories = [
    const Story1(),
    const Story2(),
    const Story3(),
  ];

  int currentStory = 0;

  List<double> percentWatched = [];

  @override
  void initState() {
    super.initState();
// initially, all stories haven't been watched
    for (int i = 0; i < myStories.length; i++) {
      percentWatched.add(0);
    }
    _startWatchingStory();
  }

  void _startWatchingStory() {
    Timer.periodic(const Duration(milliseconds: 50), (timer) {
      setState(() {
        // only ass 0.01 as long as its bellow 1
        percentWatched[currentStory] += 0.01;

        if (percentWatched[currentStory] + 0.01 < 1) {
          percentWatched[currentStory] += 0.01;
        } else {
          percentWatched[currentStory] = 1;
          timer.cancel();

          // move to next story as long as there are more stories to go through
          if (currentStory < myStories.length - 1) {
            currentStory++;
            _startWatchingStory();
          }

          // if we finished the last story, return to the feed
          else {
            Navigator.pop(context);
          }
        }
      });
    });
  }

  void _userTapDown(TapDownDetails details) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double dx = details.globalPosition.dx;

    // If user taps first half of the screen width
    if (dx < screenWidth / 2) {
      setState(() {
        // if user if on the first story, restart the story
        if (currentStory == 0) {
          percentWatched[currentStory] = 0;
        }

        // if user is passed the first story
        if (currentStory > 0) {
          // set previous and current story watched percentage back to 0
          percentWatched[currentStory] = 0;
          percentWatched[currentStory - 1] = 0;

          // go back tp previous story
          currentStory--;
        }
      });
    }
    // If user taps second half of the screen width
    else {
      setState(() {
        // check is there are more stories left
        if (currentStory < myStories.length - 1) {
          // finish the current story
          percentWatched[currentStory] = 1;
          // go to next story
          currentStory++;
        } else {
          percentWatched[currentStory] = 1;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        _userTapDown(details);
      },
      child: Scaffold(
        body: Stack(
          children: [
            // stories
            myStories[currentStory],

            // Story bar
            StoryBars(percentageWatched: percentWatched),
          ],
        ),
      ),
    );
  }
}
