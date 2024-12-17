import 'package:flutter/material.dart';
import 'package:my_trainings/core/theme/colors.dart';

class PageBackground extends StatelessWidget {
  const PageBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 0,
      children: [
        Flexible(
          flex: 1,
          child: Container(
            color: AppColors.primaryColor,
          ),
        ),
        Flexible(
          flex: 3,
          child: Container(
            color: AppColors.white,
          ),
        )
      ],
    );
  }
}
