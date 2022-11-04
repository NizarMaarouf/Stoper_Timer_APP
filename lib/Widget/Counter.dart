// ignore_for_file: file_names, prefer_const_constructors, non_constant_identifier_names, unused_local_variable, unrelated_type_equality_checks

import 'dart:async';

import 'package:flutter/material.dart';

class StoperTimerApp extends StatefulWidget {
  const StoperTimerApp({super.key});

  @override
  State<StoperTimerApp> createState() => _StoperTimerAppState();
}

class _StoperTimerAppState extends State<StoperTimerApp> {
  //----------------DURATION TIME---------------------------------
  Duration deuration = Duration(seconds: 0);
  //we must put the ? in the end of Timer .....
  Timer? downSeconds;
//------------------STARTTIMER FUNCTION--------------------------
  startTimer() {
    downSeconds = Timer.periodic(Duration(seconds: 1), (test) {
      setState(() {
        int newSeconds = deuration.inSeconds;
        deuration = Duration(seconds: newSeconds + 1);
      });
    });
  }

//-----------------CANCELTIMER FUNCTION---------------------------
  cancelTimer() {
    int newSeconds = deuration.inSeconds;
    setState(() {
      deuration.inSeconds > 0
          ? deuration = Duration(seconds: 0)
          : deuration = Duration(seconds: newSeconds);
      isRunning = false;
    });
  }

//---------------------STOPTIMER FUNCTION----------------------------
  stopTimer() {
    int newSeconds = deuration.inSeconds;
    setState(() {
      downSeconds!.cancel();
      isRunning = true;
    });
  }

//--------------------RESUMETIMER FUNCTION----------------------------
  resumeTimer() {
    int newSeconds = deuration.inSeconds;
    setState(() {
      startTimer();
    });
  }

//-------------------HELPER PARAMETER--------------------------------
  bool isRunning = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Text(
            'STOPER',
            style: TextStyle(fontSize: 30, color: Colors.amber),
          ),
          centerTitle: true,
        ),
//-----------------------------BODY-----------------------------------------
        body: Container(
          padding: EdgeInsets.fromLTRB(30, 8, 30, 8),
          color: Colors.yellow[800],
          width: double.infinity,
          height: double.infinity,

//-----------------------THE BOX'S OF THE TIMER -----------------------------
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
//------------------------TITLE CREATE---------------------------------------
              Container(
                margin: EdgeInsets.only(bottom: 100),
                alignment: AlignmentDirectional.center,
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.blue[800],
                  border: Border.all(width: 2, color: Colors.white),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  'Created By Nizar Maarouf',
                  style: TextStyle(fontSize: 25, color: Colors.amber),
                ),
              ),
//----------------------TEXT : NAME OF THE TIME BOX----------------------------
              Container(
                width: double.infinity,
                height: 50,
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text(
                      'Hours',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[800]),
                    ),
                    Text(
                      'Minutes',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[800]),
                    ),
                    Text(
                      'Seconds',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[800]),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      padding: EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: Colors.blue[800],
                        border: Border.all(width: 2, color: Colors.white),
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
                        border: Border.all(width: 2, color: Colors.white),
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
                        border: Border.all(width: 2, color: Colors.white),
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
                            (downSeconds!.isActive)
                                ? stopTimer()
                                : resumeTimer();
                          },
                          child: Text(
                            downSeconds!.isActive ? 'Stop' : 'Resume',
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
                            padding: EdgeInsets.symmetric(horizontal: 10),
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
                        padding: EdgeInsets.symmetric(horizontal: 20),
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
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
