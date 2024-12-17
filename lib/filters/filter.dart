import 'package:my_trainings/filters/filter_enum_type.dart';

abstract interface class Filter {
  final FilterEnumType type;
  Set<String> selectedItems = {};
  List<String> filteredItems = [];
  List<String> originalItems = [];

  Filter(this.type);
  List<String> getFilterItems();
  void toggleSelection(String item);
  Set<String> getSelectedItems();

  void onSearch(String? searchKey);
}
