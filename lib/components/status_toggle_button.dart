import 'package:flutter/material.dart';

class StatusToggleButton extends StatelessWidget {
  const StatusToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    bool statusIsOn = false;

    return InkWell(
      onTap: () {
        statusIsOn = !statusIsOn;
      },
      child: Container(
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
                width: MediaQuery.of(context).size.width * 0.13,
                height: 40,
                padding: const EdgeInsets.symmetric(horizontal: 2),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(
                      0xFFBFBFBF,
                    ),
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: statusIsOn
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                              color: const Color(0xFFF9C626),
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                              color: const Color(0xFFBFBFBF),
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ],
                      )),
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'ON/OFF',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                ),
                Text(
                  'Water pump',
                  style: TextStyle(fontSize: 10),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
