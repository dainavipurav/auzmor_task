import 'package:my_trainings/filters/filter.dart';
import 'package:my_trainings/filters/filter_enum_type.dart';

class LocationFilter implements Filter {
  @override
  late List<String> filteredItems;

  @override
  late List<String> originalItems;

  @override
  late Set<String> selectedItems;

  LocationFilter(List<String> locations) {
    selectedItems = {};
    originalItems = List.from(locations);
    filteredItems = List.from(originalItems);
  }

  @override
  List<String> getFilterItems() {
    return filteredItems;
  }

  @override
  void toggleSelection(String item) {
    if (selectedItems.contains(item)) {
      selectedItems.remove(item);
    } else {
      selectedItems.add(item);
    }
  }

  @override
  Set<String> getSelectedItems() {
    return selectedItems;
  }

  @override
  FilterEnumType get type => FilterEnumType.location;

  @override
  void onSearch(String? searchKey) {
    if (searchKey == null || searchKey.trim().isEmpty) {
      filteredItems = List.from(originalItems);
      return;
    }

    filteredItems.removeWhere(
      (element) {
        return !element.toLowerCase().contains(searchKey.toLowerCase());
      },
    );
  }
}
