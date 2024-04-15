import 'package:firebase_database/firebase_database.dart';

class SensorData {
  int ec;
  double humidity;
  int luminousIntensity;
  int ph;
  double temperature;
  int waterLevel;

  SensorData({
    required this.ec,
    required this.humidity,
    required this.luminousIntensity,
    required this.ph,
    required this.temperature,
    required this.waterLevel,
  });

  factory SensorData.fromSnapshot(DataSnapshot snapshot) {
    final data = snapshot.value as Map<Object?, Object?>;
    return SensorData(
      ec: data['EC'] as int,
      humidity: data['humidity'] as double,
      luminousIntensity: data['luminous_intensity'] as int,
      ph: data['pH'] as int,
      temperature: data['temperature'] as double,
      waterLevel: data['water_level'] as int,
    );
  }
}
