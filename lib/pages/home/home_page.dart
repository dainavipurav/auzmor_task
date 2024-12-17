import 'package:flutter/material.dart';
import 'package:my_trainings/components/page_layout.dart';
import 'package:my_trainings/components/filter_widget/filter_button.dart';
import 'package:my_trainings/pages/home/highlights_carousal/highlights_carousal.dart';
import 'package:my_trainings/pages/home/training_list/training_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40),
          HighlightsCarousal(),
          SizedBox(),
          FilterButton(),
          Expanded(child: TrainingList())
        ],
      ),
    );
  }
}
