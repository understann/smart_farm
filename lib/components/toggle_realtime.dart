import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:smart_farm/components/status_toggle_button.dart';

class ToggleRealtime extends StatefulWidget {
  const ToggleRealtime({super.key});

  @override
  State<ToggleRealtime> createState() => _ToggleRealtimeState();
}

class _ToggleRealtimeState extends State<ToggleRealtime> {
  num waterPumpStatus = 0;
  num eneryStatus = 0;

  final databaseRef = FirebaseDatabase.instance.ref();
  late DatabaseReference ledRef;
  late DatabaseReference pumpRef;

  @override
  void initState() {
    super.initState();
    ledRef = databaseRef.child('SMF01/actuator/led');
    pumpRef = databaseRef.child('SMF01/actuator/pump');
    _fetchDeviceStates();
  }

  void _fetchDeviceStates() async {
    final ledSnapshot = await ledRef.get();
    final pumpSnapshot = await pumpRef.get();

    if (ledSnapshot.exists && pumpSnapshot.exists) {
      setState(() {
        eneryStatus = ledSnapshot.value as num;
        waterPumpStatus = pumpSnapshot.value as num;
      });
    }
  }

  void toggleWaterPumpStatus() async{
    num newStatus;
    if(waterPumpStatus == 1){
      newStatus = 0;
    }else{
      newStatus = 1;
    }
    await databaseRef.child('SMF01/actuator/pump').set(newStatus);
    print('toggling water pump');
    setState(() {
      waterPumpStatus = newStatus;
    });
  }

  void toggleEnergyStatus() async{
    num newStatus;
    if(eneryStatus == 1){
      newStatus = 0;
    }else{
      newStatus = 1;
    }
    await databaseRef.child('SMF01/actuator/led').set(newStatus);
    print('toggling energy');
    setState(() {
      eneryStatus = newStatus;
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
                  buttonStatus: waterPumpStatus == 1,
                ),
              ),
               InkWell(
                onTap: () {
                  toggleEnergyStatus();
                },
                child: StatusToggleButton(
                  buttonLabel: 'Energy',
                  buttonStatus: eneryStatus == 1,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
