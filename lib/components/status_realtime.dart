import 'package:flutter/material.dart';
import 'package:smart_farm/components/long_status_box.dart';
import 'package:smart_farm/components/status_box.dart';
import 'package:smart_farm/screen/main_screen.dart';

class StatusRealtime extends StatefulWidget {
  const StatusRealtime({super.key});

  @override
  State<StatusRealtime> createState() => _StatusRealtimeState();
}

class _StatusRealtimeState extends State<StatusRealtime> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child:  Column(
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
              StatusBox(statusColor: StatusColors.red.colorValue,sensorValue: '49°',sensorValueUnit: '', sensorLabel: 'Temperature'),
              StatusBox(statusColor: StatusColors.green.colorValue, sensorValue: '32%',sensorValueUnit: '', sensorLabel: 'Humidity')
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              StatusBox(statusColor: StatusColors.green.colorValue,sensorValue: '6.00',sensorValueUnit: 'mS/cm', sensorLabel: 'EC'),
              StatusBox(statusColor: StatusColors.green.colorValue,
                  sensorValue: '35000',sensorValueUnit: 'Lux', sensorLabel: 'light intensity'),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              StatusBox(statusColor: StatusColors.black.colorValue,sensorValue: '2',sensorValueUnit: '', sensorLabel: 'PH'),
              StatusBox(
                  statusColor: StatusColors.black.colorValue,sensorValue: '309',sensorValueUnit: 'ppm', sensorLabel: 'TDS'),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          const LongStatusBox(mainLabel: 'Tank Water',description: 'max 8 litre',)
        ],
      ),
    );
  }
}
