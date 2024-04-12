import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LongStatusBox extends StatelessWidget {
  const LongStatusBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.80,
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
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        child: Row(
          children: [
            Container(
              width: 5,
              margin: const EdgeInsets.symmetric(vertical: 10),
              decoration: const BoxDecoration(color: Colors.red),
            ),
            const SizedBox(
              width: 10,
            ),
             Expanded(
              child: Container(
                padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Tank Water',
                          style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFF1B4139)),
                        ),
                        Text(
                          "max 8 litre",
                          style:
                              TextStyle(fontSize: 16, color: Color(0xFF1B4139)),
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
