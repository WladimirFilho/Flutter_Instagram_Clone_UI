import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

// ignore: must_be_immutable
class StoryBars extends StatelessWidget {
  StoryBars({
    super.key,
    required this.percentageWatched,
  });

  // List that contains the percentage of the stories

  List<double> percentageWatched = [
    // percentageWatched[0]
    // percentageWatched[1]
    // percentageWatched[2]
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 12),
      child: Row(
        children: [
          Expanded(
            child: LinearPercentIndicator(
              lineHeight: 15,
              percent: percentageWatched[0],
              progressColor: const Color.fromARGB(255, 57, 57, 57),
              backgroundColor: Colors.grey,
              barRadius: const Radius.circular(20),
            ),
          ),
          Expanded(
            child: LinearPercentIndicator(
              lineHeight: 15,
              percent: percentageWatched[1],
              progressColor: const Color.fromARGB(255, 57, 57, 57),
              backgroundColor: Colors.grey,
              barRadius: const Radius.circular(20),
            ),
          ),
          Expanded(
            child: LinearPercentIndicator(
              lineHeight: 15,
              percent: percentageWatched[2],
              progressColor: const Color.fromARGB(255, 57, 57, 57),
              backgroundColor: Colors.grey,
              barRadius: const Radius.circular(20),
            ),
          ),
        ],
      ),
    );
  }
}
