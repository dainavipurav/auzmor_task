import 'package:my_trainings/filters/filter.dart';
import 'package:my_trainings/controller/filter_controller.dart';
import 'package:my_trainings/filters/filter_enum_type.dart';
import 'package:my_trainings/filters/impl/location_filter.dart';
import 'package:my_trainings/filters/impl/training_name_filter.dart';
import 'package:my_trainings/filters/impl/trainer_name_filter.dart';

class FilterManager {
  final Map<FilterEnumType, Filter> filters = {};
  final controller = FilterController.to;

  FilterManager({
    required List<String> locations,
    required List<String> trainingName,
    required List<String> trainerName,
  }) {
    filters[FilterEnumType.location] = LocationFilter(locations);
    filters[FilterEnumType.trainingName] = TrainingNameFilter(trainingName);
    filters[FilterEnumType.trainerName] = TrainerNameFilter(trainerName);
    populateFilters();
  }

  void populateFilters() {
    for (FilterEnumType type in controller.selectedItems.keys) {
      filters[type]?.selectedItems = controller.selectedItems[type] ?? {};
    }
  }

  Filter? getFilter(FilterEnumType type) {
    return filters[type];
  }

  Set<String> getSelectedItems(FilterEnumType type) {
    return filters[type]?.getSelectedItems() ?? {};
  }

  List<String> getFilterItems(FilterEnumType type) {
    return filters[type]?.getFilterItems() ?? [];
  }

  void toggleSelection(FilterEnumType type, String item) {
    filters[type]?.toggleSelection(item);

    controller.selectedItems[type] = filters[type]?.selectedItems ?? {};
  }

  void onSearch(FilterEnumType type, String searchKey) {
    filters[type]?.onSearch(searchKey);
  }
}
