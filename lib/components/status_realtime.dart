import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:smart_farm/components/long_status_box.dart';
import 'package:smart_farm/components/status_box.dart';
import 'package:smart_farm/models/sensor_data_model.dart';
import 'package:smart_farm/screen/main_screen.dart';

final database = FirebaseDatabase.instance.ref();

Future<SensorData> readSensorData() async {
  final snapshot = await database.child('SMF01/sensor').get();
  return SensorData.fromSnapshot(snapshot);
}

Future<Map<Object?, Object?>> retrievePlantRangeData(String plant) async {
  final databaseRef = FirebaseDatabase.instance.ref();
  final plantSnapshot = await databaseRef.child('plant/$plant').get();

  final plantData = plantSnapshot.value as Map<Object?, Object?>;
  print(plantData);
  return plantData;
}

class StatusRealtime extends StatefulWidget {
  const StatusRealtime({super.key, required this.plant});

  final String plant;

  @override
  State<StatusRealtime> createState() => _StatusRealtimeState();
}

class _StatusRealtimeState extends State<StatusRealtime> {
  var valueRange;
  void getValueRange() async {
    valueRange = await retrievePlantRangeData(widget.plant);
    setState(() {});
  }

  Color plantStatusColor(String status, num value) {
    final maxValue = valueRange['${status}max'] as num;
    final minValue = valueRange['${status}min'] as num;
    print('${status} max : ${maxValue}');
    print(value);
    print('${status} min : ${minValue}');
    if (value > maxValue) {
      return StatusColors.red.colorValue;
    } else if (value > minValue) {
      return StatusColors.green.colorValue;
    } else {
      return StatusColors.black.colorValue;
    }
  }

  @override
  void initState() {
    getValueRange();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant StatusRealtime oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.plant != oldWidget.plant) {
      getValueRange();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: FutureBuilder<SensorData>(
            future: readSensorData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: const Center(
                      child:  CircularProgressIndicator(
                        color: Color(0xFF47D404),
                      ),
                    ));
              } else if (snapshot.hasError) {
                print(snapshot.error);
                return Text('Error: ${snapshot.error}');
              } else {
                final data = snapshot.data!;
                return Column(
                  children: [
                    const Row(
                      children: [
                        Text(
                          'Status real time',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(Icons.search)
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        StatusBox(
                            statusColor:
                                plantStatusColor('temp', data.temperature),
                            sensorValue: '${data.temperature}°',
                            sensorValueUnit: '',
                            sensorLabel: 'Temperature'),
                        StatusBox(
                            statusColor:
                                plantStatusColor('humidity', data.humidity),
                            sensorValue: '${data.humidity}%',
                            sensorValueUnit: '',
                            sensorLabel: 'Humidity')
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        StatusBox(
                            statusColor: plantStatusColor('EC', data.ec),
                            sensorValue: '${data.ec}',
                            sensorValueUnit: 'mS/cm',
                            sensorLabel: 'EC'),
                        StatusBox(
                            statusColor:
                                plantStatusColor('lux', data.luminousIntensity),
                            sensorValue: '${data.luminousIntensity}',
                            sensorValueUnit: 'Lux',
                            sensorLabel: 'light intensity'),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        StatusBox(
                            statusColor: plantStatusColor('pH', data.ph),
                            sensorValue: '${data.ph}',
                            sensorValueUnit: '',
                            sensorLabel: 'PH'),
                        StatusBox(
                            statusColor: StatusColors.black.colorValue,
                            sensorValue: '${data.waterLevel}',
                            sensorValueUnit: 'ppm',
                            sensorLabel: 'TDS'),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const LongStatusBox(
                      mainLabel: 'Tank Water',
                      description: 'max 8 litre',
                    )
                  ],
                );
              }
            }));
  }
}
