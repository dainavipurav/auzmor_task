import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_trainings/controller/home_controller.dart';
import 'package:my_trainings/pages/home/training_list/training_list_item.dart';
import 'package:my_trainings/core/theme/colors.dart';

class TrainingList extends StatelessWidget {
  TrainingList({super.key});
  final xController = HomeController.to;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Container(
          color: AppColors.lightGrey,
          height: double.infinity,
          width: double.infinity,
          child: xController.filteredList.isEmpty
              ? Center(
                  child: Text(
                    xController.filteredList.isEmpty ||
                            xController.originalList.isEmpty
                        ? 'No Filters Found'
                        : 'No Data Found',
                  ),
                )
              : ListView.builder(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  itemBuilder: (context, index) => TrainingListItem(
                    training: xController.filteredList[index],
                  ),
                  itemCount: xController.filteredList.length,
                ),
        );
      },
    );
  }
}
