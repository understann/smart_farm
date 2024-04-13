import 'package:flutter/material.dart';
import 'package:smart_farm/components/status_toggle_button.dart';

class ToggleRealtime extends StatefulWidget {
  const ToggleRealtime({super.key});

  @override
  State<ToggleRealtime> createState() => _ToggleRealtimeState();
}

class _ToggleRealtimeState extends State<ToggleRealtime> {
  bool waterPumpStatus = false;
  bool eneryStatus = false;

  void toggleWaterPumpStatus() {
    print('toggling water pump');
    setState(() {
      waterPumpStatus = !waterPumpStatus;
    });
  }

  void toggleEnergyStatus() {
    print('toggling energy');
    setState(() {
      eneryStatus = !eneryStatus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
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
              InkWell(
                onTap: () {
                  toggleWaterPumpStatus();
                },
                child: StatusToggleButton(
                  buttonLabel: 'Water pump',
                  buttonStatus: waterPumpStatus,
                ),
              ),
               InkWell(
                onTap: () {
                  toggleEnergyStatus();
                },
                child: StatusToggleButton(
                  buttonLabel: 'Energy',
                  buttonStatus: eneryStatus,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
