import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_trainings/controller/filter_controller.dart';
import 'package:my_trainings/components/filter_widget/tab_item.dart';
import 'package:my_trainings/core/theme/colors.dart';
import 'package:my_trainings/filters/filter_enum_type.dart';
import 'package:my_trainings/filters/filter_manager.dart';
import 'package:my_trainings/controller/home_controller.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  late FilterManager filterManager;
  final filterController = FilterController.to;
  final homeController = HomeController.to;

  @override
  void initState() {
    super.initState();
    filterManager = FilterManager(
      locations: _getLocationList(),
      trainerName: _getTrainerNameList(),
      trainingName: _getTrainingNameList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _header(context),
        Divider(height: 0),
        _body(context),
      ],
    );
  }

  Widget _body(BuildContext context) {
    return Obx(
      () => Expanded(
        child: Row(
          children: [
            _filterTypeList(context),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _searchField(),
                    SizedBox(height: 16),
                    _filterOptionsList(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _filterOptionsList() {
    return Expanded(
      child: ListView.builder(
        itemCount: filterManager
            .getFilterItems(filterController.selectedFilterType.value)
            .length,
        itemBuilder: (context, index) {
          final filterItem = filterManager
              .getFilterItems(filterController.selectedFilterType.value)[index];
          return CheckboxListTile(
            title: Text(
              filterItem,
              style: GoogleFonts.roboto(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            value: filterManager
                .getSelectedItems(filterController.selectedFilterType.value)
                .contains(filterItem),
            onChanged: (value) {
              setState(() {
                filterManager.toggleSelection(
                    filterController.selectedFilterType.value, filterItem);
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            activeColor: AppColors.primaryColor,
          );
        },
      ),
    );
  }

  Widget _searchField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: AppColors.grey,
          ),
          hintText: "Search",
        ),
        onChanged: (value) {
          filterManager.onSearch(
            filterController.selectedFilterType.value,
            value,
          );
          setState(() {});
        },
      ),
    );
  }

  Widget _filterTypeList(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      color: AppColors.lightGrey,
      child: Column(
        children: [
          Flexible(
            child: ListView.builder(
              itemBuilder: (context, index) {
                final filterType = FilterEnumType.values[index];
                return TabItem(
                  type: filterType,
                  isSelected:
                      filterController.selectedFilterType.value == filterType,
                  onTap: () {
                    filterController.selectedFilterType.value = filterType;
                  },
                );
              },
              itemCount: FilterEnumType.values.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget _header(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Sort and Filters',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.close),
          ),
        ],
      ),
    );
  }

  List<String> _getLocationList() {
    return List.from(
      homeController.originalList
          .where((e) => e.address.toString().trim().isNotEmpty)
          .map((e) => e.address.toString().trim())
          .toSet()
          .toList(),
    );
  }

  List<String> _getTrainerNameList() {
    return List.from(
      homeController.originalList
          .where((e) =>
              e.trainer != null &&
              e.trainer!.name != null &&
              e.trainer!.name.toString().trim().isNotEmpty)
          .map((e) => e.trainer!.name.toString().trim())
          .toSet()
          .toList(),
    );
  }

  List<String> _getTrainingNameList() {
    return List.from(
      homeController.originalList
          .where((e) => e.title.toString().trim().isNotEmpty)
          .map((e) => e.title.toString().trim())
          .toSet()
          .toList(),
    );
  }
}
