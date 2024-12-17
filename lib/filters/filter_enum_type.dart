enum FilterEnumType {
  location,
  trainingName,
  trainerName;

  String get displayName {
    return switch (this) {
      location => 'Location',
      trainingName => 'Training Name',
      trainerName => 'Trainer',
    };
  }
}
