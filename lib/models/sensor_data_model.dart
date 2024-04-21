import 'package:firebase_database/firebase_database.dart';

class SensorData {
  double ec;
  double humidity;
  int luminousIntensity;
  double ph;
  double temperature;
  int waterLevel;
  int tds;

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
      ec: data['EC'] as double,
      humidity: data['humidity'] as double,
      luminousIntensity: data['luminous_intensity'] as int,
      ph: data['pH'] as double,
      temperature: data['temperature'] as double,
      waterLevel: data['water_level'] as int,
      tds: data['TDS'] as int,
    );
  }
}
