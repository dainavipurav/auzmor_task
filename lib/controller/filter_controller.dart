import 'package:get/get.dart';
import 'package:my_trainings/filters/filter_enum_type.dart';

class FilterController extends GetxController {
  static final to = Get.isRegistered<FilterController>()
      ? Get.find<FilterController>()
      : Get.put(FilterController(), permanent: true);

  RxMap<FilterEnumType, Set<String>> selectedItems = RxMap({});

  Rx<FilterEnumType> selectedFilterType =
      Rx<FilterEnumType>(FilterEnumType.location);

  @override
  void onInit() {
    selectedItems.value = {
      FilterEnumType.location: {},
      FilterEnumType.trainerName: {},
      FilterEnumType.trainingName: {},
    };
    super.onInit();
  }

  bool checkFilterApplied() {
    for (FilterEnumType type in selectedItems.keys) {
      if ((selectedItems[type] ?? {}).isNotEmpty) {
        return true;
      }
    }
    return false;
  }
}
