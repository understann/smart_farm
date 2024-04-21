import 'dart:collection';
import 'dart:ffi';

class PlantData {
  double ecMax;
  double ecMin;
  double tdsMax;
  double tdsMin;
  double humidityMax;
  double humidityMin;
  double luxMax;
  double luxMin;
  double pHMax;
  double pHMin;
  double tempMax;
  double tempMin;

  PlantData(
      {required this.ecMax,
      required this.ecMin,
      required this.tdsMax,
      required this.tdsMin,
      required this.humidityMax,
      required this.humidityMin,
      required this.luxMax,
      required this.luxMin,
      required this.pHMax,
      required this.pHMin,
      required this.tempMax,
      required this.tempMin});
}
