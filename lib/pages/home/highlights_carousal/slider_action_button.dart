import 'package:flutter/material.dart';
import 'package:my_trainings/core/theme/colors.dart';

class SliderActionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  const SliderActionButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 100,
        width: 28,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.black26,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(2),
            bottomRight: Radius.circular(2),
          ),
        ),
        child: Center(
          child: Icon(
            icon,
            size: 20,
            color: AppColors.white,
            weight: 10,
          ),
        ),
      ),
    );
  }
}
