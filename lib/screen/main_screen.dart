import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smart_farm/components/dropdown_button.dart';
import 'package:smart_farm/components/status_realtime.dart';
import 'package:smart_farm/components/toggle_realtime.dart';
import 'package:url_launcher/url_launcher.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String selectedValue = 'Green Oak';
  final manualURI = Uri.parse('https://devcommunities.github.io/');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(color: Color(0xFFFAFAFA)),
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          color: const Color(0xFFCCCCCC), width: 1.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                  text: 'Hi! ',
                                  style: TextStyle(
                                      fontSize: 40, color: Colors.black)),
                              TextSpan(
                                  text: '-',
                                  style: TextStyle(
                                      fontSize: 40, color: Color(0xFF1B4139))),
                              TextSpan(
                                  text: ' Aorauma',
                                  style: TextStyle(
                                      fontSize: 40, color: Colors.black)),
                            ],
                          ),
                        ),
                        const Text(
                          'How was your planting?',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomDropdown(
                    items: const [
                      'Green Oak',
                      'Salad Vegetable',
                      'Bonsai Tree',
                      'Glass House'
                    ],
                    value: selectedValue,
                    onChanged: (newValue) {
                      setState(
                        () {
                          selectedValue = newValue!;
                        },
                      );
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const StatusRealtime(),
                  const SizedBox(
                    height: 15,
                  ),
                  const ToggleRealtime(),
                ],
              ),
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      launchUrl(
                        manualURI,
                        mode: LaunchMode.externalApplication,
                      );
                    },
                    child: const SizedBox(
                      child: Text(
                        'user manual',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF656565),
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const SizedBox(
                      child: Text(
                        'Logout',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF656565),
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
