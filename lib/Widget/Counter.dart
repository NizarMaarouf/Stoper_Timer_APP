// ignore_for_file: file_names, prefer_const_constructors, non_constant_identifier_names, unused_local_variable, unrelated_type_equality_checks

import 'dart:async';

import 'package:flutter/material.dart';

class StoperTimerApp extends StatefulWidget {
  const StoperTimerApp({super.key});

  @override
  State<StoperTimerApp> createState() => _StoperTimerAppState();
}

class _StoperTimerAppState extends State<StoperTimerApp> {
  Duration deuration = Duration(seconds: 0);
  //we must put the ? in the end of Timer .....
  Timer? downSeconds;

  startTimer() {
    downSeconds = Timer.periodic(Duration(seconds: 1), (test) {
      setState(() {
        int newSeconds = deuration.inSeconds;
        deuration = Duration(seconds: newSeconds + 1);
      });
    });
  }

  cancelTimer() {
    int newSeconds = deuration.inSeconds;
    setState(() {
      deuration.inSeconds > 0
          ? deuration = Duration(seconds: 0)
          : deuration = Duration(seconds: newSeconds);
      isRunning = false;
    });
  }

  bool isRunning = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          padding: EdgeInsets.fromLTRB(30, 8, 30, 8),
          color: Colors.grey[900],
          width: double.infinity,
          height: double.infinity,
//-----------------------THE BOX'S OF THE TIMER -----------------------------
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: EdgeInsets.all(18),
                    // width: 100,
                    // height: 100,
                    decoration: BoxDecoration(
                      color: Colors.blue[800],
                      border: Border.all(width: 3, color: Colors.white),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      deuration.inHours
                          .remainder(24)
                          .toString()
                          .padLeft(2, "0"),
                      style: TextStyle(fontSize: 50, color: Colors.amber),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(18),
                    // width: 100,
                    // height: 100,
                    decoration: BoxDecoration(
                      color: Colors.blue[800],
                      border: Border.all(width: 3, color: Colors.white),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      deuration.inMinutes
                          .remainder(60)
                          .toString()
                          .padLeft(2, "0"),
                      style: TextStyle(fontSize: 50, color: Colors.amber),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(18),
                    // width: 100,
                    // height: 100,
                    decoration: BoxDecoration(
                      color: Colors.blue[800],
                      border: Border.all(width: 3, color: Colors.white),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      deuration.inSeconds
                          .remainder(60)
                          .toString()
                          .padLeft(2, "0"),
                      style: TextStyle(fontSize: 50, color: Colors.amber),
                    ),
                  ),
                ],
              ),

//----------------------TEXT : NAME OF THE TIME BOX----------------------------
              Container(
                width: double.infinity,
                height: 50,
                margin: EdgeInsets.only(top: 10),
                // padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
                child: Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      'Hours',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Text(
                      'Minutes',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(
                      width: 35,
                    ),
                    Text(
                      'Seconds',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),

//-------------------------THR BUTTON OF THE STOPER---------------------------
              isRunning
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.red,
                            minimumSize: Size(80, 35),
                            padding: EdgeInsets.symmetric(horizontal: 10),
                          ),
                          onPressed: () {
                            downSeconds!.cancel();
                          },
                          child: Text(
                            'Stop Timer',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.red,
                            minimumSize: Size(80, 35),
                            padding: EdgeInsets.symmetric(horizontal: 30),
                          ),
                          onPressed: () {
                            cancelTimer();
                          },
                          child: Text(
                            'Cansel',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    )
                  : ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        // foregroundColor: Colors.white,
                        backgroundColor: Colors.blue[900],
                        minimumSize: Size(80, 35),
                        padding: EdgeInsets.symmetric(horizontal: 10),
                      ),
                      onPressed: () {
                        startTimer();
                        setState(() {
                          isRunning = true;
                        });
                      },
                      child: Text(
                        'Start Timer',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
