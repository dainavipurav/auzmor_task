import 'dart:convert';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_trainings/models/training_model.dart';

class HomeController extends GetxController {
  static final to = Get.isRegistered<HomeController>()
      ? Get.find<HomeController>()
      : Get.put(HomeController());

  final swiperController = SwiperController();

  RxBool isLoading = RxBool(false);
  RxnString errorMessage = RxnString();

  RxList<TrainingModel> originalList = <TrainingModel>[].obs;
  RxList<TrainingModel> filteredList = <TrainingModel>[].obs;

  @override
  void onInit() {
    loadTrainingList();
    super.onInit();
  }

  @override
  void dispose() {
    swiperController.dispose();
    super.dispose();
  }

  Future<void> loadTrainingList() async {
    try {
      isLoading(true);
      final trainingJson =
          await rootBundle.loadString('assets/jsons/application_data.json');

      if (trainingJson.trim().isEmpty) {
        originalList.value = [];
        filteredList.value = List.from(originalList);
        return;
      }
      final Map<String, dynamic> data = jsonDecode(trainingJson);

      if (data.containsKey('data') && data['data'] is List) {
        final jsonList = List<Map<String, dynamic>>.from(data['data']);

        originalList.value =
            jsonList.map((e) => TrainingModel.fromMap(e)).toList();
        filteredList.value = List.from(originalList);
        return;
      } else {
        originalList.value = [];
        filteredList.value = List.from(originalList);
        return;
      }
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading(false);
    }
  }

  void applyFilter({
    Set<String> address = const {},
    Set<String> trainerName = const {},
    Set<String> trainingName = const {},
  }) {
    filteredList.value = List.from(
      originalList.where((element) {
        bool addressMatch = address.isEmpty ||
            address.contains(
              element.address.toString().trim(),
            );

        bool trainerNameMatch = trainerName.isEmpty ||
            trainerName.contains(
              element.trainer!.name.toString().trim(),
            );

        bool trainingNameMatch = trainingName.isEmpty ||
            trainingName.contains(
              element.title.toString().trim(),
            );
        return addressMatch && trainingNameMatch && trainerNameMatch;
      }).toList(),
    );
  }

  void resetFilter() {
    filteredList.value = List.from(originalList);
  }
}
