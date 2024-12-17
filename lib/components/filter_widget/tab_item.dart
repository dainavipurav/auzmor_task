import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_trainings/core/theme/colors.dart';
import 'package:my_trainings/controller/filter_controller.dart';
import 'package:my_trainings/filters/filter_enum_type.dart';

class TabItem extends StatelessWidget {
  final FilterEnumType type;
  final bool isSelected;
  final VoidCallback onTap;

  const TabItem({
    super.key,
    required this.type,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: isSelected ? Colors.white : Colors.transparent,
        child: Row(
          children: [
            Container(
              width: 4,
              height: 50,
              color: !isSelected ? Colors.transparent : Colors.red,
            ),
            SizedBox(width: 8),
            Expanded(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 5),
                    child: Text(
                      type.displayName,
                      style: GoogleFonts.roboto(
                        fontSize: 14,
                        fontWeight:
                            !isSelected ? FontWeight.w400 : FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    child: Obx(() {
                      if ((FilterController.to.selectedItems[type] ?? {})
                          .isNotEmpty) {
                        return Align(
                          alignment: Alignment.topRight,
                          child: CircleAvatar(
                            radius: 3,
                            backgroundColor: AppColors.primaryColor,
                          ),
                        );
                      }
                      return SizedBox();
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
