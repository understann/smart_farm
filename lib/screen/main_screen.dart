import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_farm/bloc/auth_bloc.dart';
import 'package:smart_farm/components/custom_dropdown.dart';
import 'package:smart_farm/components/status_realtime.dart';
import 'package:smart_farm/components/toggle_realtime.dart';
import 'package:smart_farm/screen/login_screen.dart';
import 'package:url_launcher/url_launcher.dart';

enum StatusColors {
  red(Color(0xFFF20000)),
  green(Color(0xFF47D404)),
  black(Color(0xFF000000));

  final Color colorValue;

  const StatusColors(this.colorValue);
}



class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String selectedValue = 'green_oak';
  final manualURI = Uri.parse('https://flutter.dev/');
  final documentNames = <String>[];
    late StreamSubscription<DatabaseEvent> _sensorDataSubscription;


  void getPlantDocumentNames() async {
    final databaseRef = FirebaseDatabase.instance.ref();
    final plantSnapshot = await databaseRef.child('plant').get();

    if (plantSnapshot.exists) {
      plantSnapshot.children.forEach((DataSnapshot childSnapshot) {
        setState(() {
          documentNames.add(childSnapshot.key!);
        });
      });
    }
    // print(documentNames);
  }

  @override
  void initState() {
    super.initState();
    getPlantDocumentNames();

     _sensorDataSubscription = database
        .child('SMF01/sensor')
        .onValue
        .listen((DatabaseEvent event) {
      setState(() {
        // print('------------------------------');
      });
    });


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
          if (state is AuthInitial) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginScreen(),
              ),
              (route) => false,
            );
          }
        }, builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Container(
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
                                        fontSize: 40,
                                        color: Color(0xFF1B4139))),
                                TextSpan(
                                    text: ' Onuma',
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
                      items: documentNames,
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
                     StatusRealtime(plant: selectedValue,),
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
                        context.read<AuthBloc>().add(AuthLogoutRequested());
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
          );
        }),
      ),
    );
  }
}
