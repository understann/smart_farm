import 'package:flutter/material.dart';
import 'package:smart_farm/components/long_status_box.dart';
import 'package:smart_farm/components/status_box.dart';

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
              StatusBox(),
              StatusBox(),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              StatusBox(),
              StatusBox(),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              StatusBox(),
              StatusBox(),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          LongStatusBox()
        ],
      ),
    );
  }
}
