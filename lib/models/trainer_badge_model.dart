// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TrainerBadgeModel {
  String? name;
  String? image;
  String? description;

  TrainerBadgeModel({
    this.name,
    this.image,
    this.description,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'image': image,
      'description': description,
    };
  }

  factory TrainerBadgeModel.fromMap(Map<String, dynamic> map) {
    return TrainerBadgeModel(
      name: map['name'] != null ? map['name'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TrainerBadgeModel.fromJson(String source) =>
      TrainerBadgeModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'TrainerBadge(name: $name, image: $image, description: $description)';
}
