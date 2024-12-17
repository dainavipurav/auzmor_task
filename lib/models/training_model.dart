// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:my_trainings/models/trainer_model.dart';

class TrainingModel {
  String? title;
  String? image;
  String? date;
  String? time;
  String? address;
  String? popularityStatus;
  double? rating;
  TrainerModel? trainer;
  int? baseAmount;
  int? discountAmount;
  int? finalAmount;

  TrainingModel({
    this.title,
    this.image,
    this.date,
    this.time,
    this.address,
    this.popularityStatus,
    this.rating,
    this.trainer,
    this.baseAmount,
    this.discountAmount,
    this.finalAmount,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'image': image,
      'date': date,
      'time': time,
      'address': address,
      'popularityStatus': popularityStatus,
      'rating': rating,
      'trainer': trainer?.toMap(),
      'baseAmount': baseAmount,
      'discountAmount': discountAmount,
      'finalAmount': finalAmount,
    };
  }

  factory TrainingModel.fromMap(Map<String, dynamic> map) {
    return TrainingModel(
      title: map['title'] != null ? map['title'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
      date: map['date'] != null ? map['date'] as String : null,
      time: map['time'] != null ? map['time'] as String : null,
      address: map['address'] != null ? map['address'] as String : null,
      popularityStatus: map['popularityStatus'] != null
          ? map['popularityStatus'] as String
          : null,
      rating: map['rating'] != null ? map['rating'] as double : null,
      trainer: map['trainer'] != null
          ? TrainerModel.fromMap(map['trainer'] as Map<String, dynamic>)
          : null,
      baseAmount: map['baseAmount'] != null ? map['baseAmount'] as int : null,
      discountAmount:
          map['discountAmount'] != null ? map['discountAmount'] as int : null,
      finalAmount:
          map['finalAmount'] != null ? map['finalAmount'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TrainingModel.fromJson(String source) =>
      TrainingModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Training(title: $title, image: $image, date: $date, time: $time, address: $address, popularityStatus: $popularityStatus, rating: $rating, trainer: $trainer, baseAmount: $baseAmount, discountAmount: $discountAmount, finalAmount: $finalAmount)';
  }
}
