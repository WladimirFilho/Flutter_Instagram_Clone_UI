import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class StoryBars extends StatelessWidget {
  const StoryBars({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: LinearPercentIndicator(
            lineHeight: 15,
            percent: 0.3,
            progressColor: const Color.fromARGB(255, 57, 57, 57),
            backgroundColor: Colors.grey,
            barRadius: const Radius.circular(20),
          ),
        ),
        Expanded(
          child: LinearPercentIndicator(
            lineHeight: 15,
            percent: 0.3,
            progressColor: const Color.fromARGB(255, 57, 57, 57),
            backgroundColor: Colors.grey,
            barRadius: const Radius.circular(20),
          ),
        ),
        Expanded(
          child: LinearPercentIndicator(
            lineHeight: 15,
            percent: 0.3,
            progressColor: const Color.fromARGB(255, 57, 57, 57),
            backgroundColor: Colors.grey,
            barRadius: const Radius.circular(20),
          ),
        ),
      ],
    );
  }
}
