import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_trainings/pages/home/highlights_carousal/carousal_list_item.dart';
import 'package:my_trainings/pages/home/highlights_carousal/slider_action_button.dart';
import 'package:my_trainings/controller/home_controller.dart';

class SwiperCarousal extends StatelessWidget {
  SwiperCarousal({super.key});

  final xController = HomeController.to;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Row(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SliderActionButton(
              icon: Icons.arrow_back_ios,
              onPressed: () => xController.swiperController.previous(),
            ),
            Expanded(
              child: SizedBox(
                height: 180,
                width: double.infinity,
                child: Swiper(
                  controller: xController.swiperController,
                  itemBuilder: (context, index) => CarousalListItem(
                    training: xController.originalList[index],
                  ),
                  itemCount: xController.originalList.length,
                  scale: 1,
                ),
              ),
            ),
            SliderActionButton(
              icon: Icons.arrow_forward_ios,
              onPressed: () => xController.swiperController.next(),
            ),
          ],
        );
      },
    );
  }
}
