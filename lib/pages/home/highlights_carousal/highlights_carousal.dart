import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_trainings/pages/home/highlights_carousal/swiper_carousal.dart';
import 'package:my_trainings/core/theme/colors.dart';

class HighlightsCarousal extends StatelessWidget {
  const HighlightsCarousal({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 20,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Highlights',
            style: GoogleFonts.poppins(
              color: AppColors.white,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SwiperCarousal(),
      ],
    );
  }
}
