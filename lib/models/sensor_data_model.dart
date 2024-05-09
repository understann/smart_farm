import 'dart:ffi';

import 'package:firebase_database/firebase_database.dart';

class SensorData {
  num ec;
  num humidity;
  num luminousIntensity;
  num ph;
  num temperature;
  num waterLevel;
  num tds;

  SensorData({
    required this.ec,
    required this.humidity,
    required this.luminousIntensity,
    required this.ph,
    required this.temperature,
    required this.waterLevel,
    required this.tds,
  });

  factory SensorData.fromSnapshot(DataSnapshot snapshot) {
    final data = snapshot.value as Map<Object?, Object?>;
    return SensorData(
      ec: data['EC'] as num,
      humidity: data['humidity'] as num,
      luminousIntensity: data['luminous_intensity'] as num,
      ph: data['pH'] as num,
      temperature: data['temperature'] as num,
      waterLevel: data['water_level'] as num,
      tds: data['TDS'] as num,
    );
  }
}
