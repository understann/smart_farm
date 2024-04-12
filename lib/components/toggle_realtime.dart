import 'package:flutter/material.dart';
import 'package:smart_farm/components/status_toggle_button.dart';

class ToggleRealtime extends StatefulWidget {
  const ToggleRealtime({super.key});

  @override
  State<ToggleRealtime> createState() => _ToggleRealtimeState();
}

class _ToggleRealtimeState extends State<ToggleRealtime> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: const Column(
        children: [
          Row(
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
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              StatusToggleButton(),
              StatusToggleButton(),
            ],
          )
        ],
      ),
    );
  }
}
