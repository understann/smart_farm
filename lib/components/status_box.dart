import 'package:flutter/material.dart';
import 'package:smart_farm/screen/main_screen.dart';

class StatusBox extends StatelessWidget {
  const StatusBox(
      {super.key,
      required this.statusColor,
      required this.sensorValue,
      required this.sensorValueUnit,
      required this.sensorLabel});

  final Color statusColor;
  final String sensorValue;
  final String sensorValueUnit;
  final String sensorLabel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.38,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          width: 1,
          color: const Color(0xFFEAEAEA),
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
        child: Row(
          children: [
            Container(
              width: 5,
              margin: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(color: statusColor),
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              sensorValue,
                              style: const TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.w800,
                                  color: Color(0xFF1B4139)),
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            Column(
                              children: [
                                Text(
                                  sensorValueUnit,
                                  style: const TextStyle(
                                      fontSize: 15, color: Color(0xFF1B4139), fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Text(
                          sensorLabel,
                          style: const TextStyle(
                              fontSize: 16, color: Color(0xFF1B4139)),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
