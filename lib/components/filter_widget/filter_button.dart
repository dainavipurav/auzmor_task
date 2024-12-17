import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_trainings/core/theme/colors.dart';
import 'package:my_trainings/controller/filter_controller.dart';
import 'package:my_trainings/filters/filter_enum_type.dart';
import 'package:my_trainings/components/filter_widget/filter_bottom_sheet.dart';
import 'package:my_trainings/controller/home_controller.dart';

class FilterButton extends StatelessWidget {
  final filterController = FilterController.to;
  final homeController = HomeController.to;

  FilterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SizedBox(
        width: 100,
        child: OutlinedButton.icon(
          onPressed: () async {
            filterController.selectedFilterType.value = FilterEnumType.location;
            await showModalBottomSheet(
              context: context,
              builder: (ctx) {
                return FilterBottomSheet();
              },
              barrierColor: AppColors.popupBarrierColor,
              backgroundColor: AppColors.white,
              elevation: 4,
              isDismissible: false,
              enableDrag: false,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
            );
            homeController.applyFilter(
              address:
                  filterController.selectedItems[FilterEnumType.location] ?? {},
              trainerName:
                  filterController.selectedItems[FilterEnumType.trainerName] ??
                      {},
              trainingName:
                  filterController.selectedItems[FilterEnumType.trainingName] ??
                      {},
            );
          },
          label: Stack(
            children: [
              Text('Filter'),
              Obx(() {
                if (!filterController.checkFilterApplied()) {
                  return SizedBox();
                }
                return Align(
                  alignment: Alignment.topRight,
                  child: CircleAvatar(
                    radius: 3,
                    backgroundColor: AppColors.primaryColor,
                  ),
                );
              }),
            ],
          ),
          icon: Icon(Icons.tune),
        ),
      ),
    );
  }
}
