// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:my_trainings/models/trainer_badge_model.dart';

class TrainerModel {
  String? name;
  String? image;
  String? designation;
  TrainerBadgeModel? trainerBadge;

  TrainerModel({
    this.name,
    this.image,
    this.designation,
    this.trainerBadge,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'image': image,
      'designation': designation,
      'trainerBadge': trainerBadge,
    };
  }

  factory TrainerModel.fromMap(Map<String, dynamic> map) {
    return TrainerModel(
      name: map['name'] != null ? map['name'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
      designation:
          map['designation'] != null ? map['designation'] as String : null,
      trainerBadge: map['trainerBadge'] != null
          ? TrainerBadgeModel.fromMap(
              map['trainerBadge'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TrainerModel.fromJson(String source) =>
      TrainerModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Trainer(name: $name, image: $image, designation: $designation, trainerBadge: $trainerBadge)';
  }
}
