import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class ClockApp extends StatefulWidget {
  const ClockApp({super.key});

  @override
  State<ClockApp> createState() => _ClockAppState();
}

class _ClockAppState extends State<ClockApp> {
  int hour = 0;
  int minute = 0;
  int second = 0;
  Timer? timer;
  bool isDigital = false;
  bool isAnalog = false;
  bool isStrap = false;
  bool isStop = false;
  DateTime dateTime = DateTime.now();
  int hh = 0;
  int mm = 0;
  int ss = 0;

  bool isOnTimer = false;
  List timeHistory = [];
  @override
  void timerClock() async {
    isOnTimer = true;
    await Future.delayed(const Duration(milliseconds: 50), () {
      if (isOnTimer) {
        ss++;
      }
      if (ss > 59) {
        ss = 0;
        mm++;
      }
      if (mm > 59) {
        mm = 0;
        hh++;
      }
      if (hh >= 12) {
        hh = 0;
      }
      setState(() {});
    });
    if (isOnTimer) {
      timerClock();
    }
  }

  Widget build(BuildContext context) {
    TextScaler textScaler = MediaQuery.textScalerOf(context);
    Size size = MediaQuery.sizeOf(context);
    double h = size.height;
    double w = size.width;
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      DateTime dateTime = DateTime.now();
      hour = dateTime.hour;
      minute = dateTime.minute;
      second = dateTime.second;

      setState(() {});
    });
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Clock",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w800),
          ),
          backgroundColor: Colors.deepOrangeAccent.shade100,
        ),
        backgroundColor: Color(0xff041955),
        drawer: Drawer(
          backgroundColor: Colors.black87,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Select Your Watch",
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: textScaler.scale(30),
                      color: Colors.white),
                ),
                Text(
                  "Save Your Each Seconds",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: textScaler.scale(15),
                      color: Colors.white),
                ),
                SizedBox(
                  height: h * 0.08,
                ),
                ListTile(
                  leading: Text(
                    "01",
                    style: TextStyle(
                        color: Colors.white54, fontSize: textScaler.scale(20)),
                  ),
                  subtitle: Text(
                    "Your Digital Time",
                    style: TextStyle(color: Colors.white54),
                  ),
                  title: Text(
                    "Digital Watch",
                    style: TextStyle(
                        fontSize: textScaler.scale(20),
                        fontWeight: FontWeight.w500,
                        color: Colors.white54),
                  ),
                  trailing: Theme(
                      data: ThemeData(useMaterial3: true),
                      child: Switch(
                        value: isDigital,
                        onChanged: (val) {
                          isDigital = val;
                          setState(() {});
                        },
                      )),
                ),
                ListTile(
                  leading: Text(
                    "02",
                    style: TextStyle(
                        color: Colors.white54, fontSize: textScaler.scale(20)),
                  ),
                  subtitle: Text(
                    "Your Clock ",
                    style: TextStyle(color: Colors.white54),
                  ),
                  title: Text(
                    "Analog Watch",
                    style: TextStyle(
                        fontSize: textScaler.scale(20),
                        fontWeight: FontWeight.w500,
                        color: Colors.white54),
                  ),
                  trailing: Theme(
                      data: ThemeData(useMaterial3: true),
                      child: Switch(
                        value: isAnalog,
                        onChanged: (val) {
                          isAnalog = val;
                          setState(() {});
                        },
                      )),
                ),
                ListTile(
                  leading: Text(
                    "03",
                    style: TextStyle(
                        color: Colors.white54, fontSize: textScaler.scale(20)),
                  ),
                  subtitle: Text(
                    "Your Strap Watch",
                    style: TextStyle(color: Colors.white54),
                  ),
                  title: Text(
                    "Strap Watch",
                    style: TextStyle(
                        fontSize: textScaler.scale(20),
                        fontWeight: FontWeight.w500,
                        color: Colors.white54),
                  ),
                  trailing: Theme(
                      data: ThemeData(useMaterial3: true),
                      child: Switch(
                        value: isStrap,
                        onChanged: (val) {
                          isStrap = val;
                          setState(() {});
                        },
                      )),
                ),
                ListTile(
                  leading: Text(
                    "04",
                    style: TextStyle(
                        color: Colors.white54, fontSize: textScaler.scale(20)),
                  ),
                  subtitle: Text(
                    "Your Stop Watch",
                    style: TextStyle(color: Colors.white54),
                  ),
                  title: Text(
                    "Stop Watch",
                    style: TextStyle(
                        fontSize: textScaler.scale(20),
                        fontWeight: FontWeight.w500,
                        color: Colors.white54),
                  ),
                  trailing: Theme(
                      data: ThemeData(useMaterial3: true),
                      child: Switch(
                        value: isStop,
                        onChanged: (val) {
                          isStop = val;
                          setState(() {});
                        },
                      )),
                ),
              ],
            ),
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    "https://img.freepik.com/free-vector/abstract-dark-blue-curve-background_53876-100999.jpg?size=626&ext=jpg&ga=GA1.1.1141335507.1717977600&semt=ais_user"),
                fit: BoxFit.fill),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: (!isDigital && !isAnalog && !isStrap && !isStop)
                  ? Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              "assets/image/output-onlinegiftools.gif"),
                        ),
                      ),
                    )
                  : Stack(
                      alignment: Alignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Visibility(
                              visible: isDigital,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: h * 0.08,
                                    width: w * 0.15,
                                    decoration: BoxDecoration(
                                      color: Colors.deepOrangeAccent.shade100,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      "${(hour % 12).toString().padLeft(2, '0')}",
                                      style: TextStyle(
                                        fontSize: textScaler.scale(42),
                                        fontWeight: FontWeight.w800,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: w * 0.02,
                                  ),
                                  Column(
                                    children: [
                                      CircleAvatar(
                                        radius: w * 0.015,
                                      ),
                                      SizedBox(
                                        height: h * 0.015,
                                      ),
                                      CircleAvatar(
                                        radius: w * 0.015,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: w * 0.02,
                                  ),
                                  Container(
                                    height: h * 0.08,
                                    width: w * 0.15,
                                    decoration: BoxDecoration(
                                      color: Colors.deepOrangeAccent.shade100,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      "${minute.toString().padLeft(2, '0')}",
                                      style: TextStyle(
                                        fontSize: textScaler.scale(42),
                                        fontWeight: FontWeight.w800,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: w * 0.02,
                                  ),
                                  Column(
                                    children: [
                                      CircleAvatar(
                                        radius: w * 0.015,
                                      ),
                                      SizedBox(
                                        height: h * 0.015,
                                      ),
                                      CircleAvatar(
                                        radius: w * 0.015,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: w * 0.02,
                                  ),
                                  Container(
                                    height: h * 0.08,
                                    width: w * 0.15,
                                    decoration: BoxDecoration(
                                      color: Colors.deepOrangeAccent.shade100,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      "${second.toString().padLeft(2, '0')}",
                                      style: TextStyle(
                                        fontSize: textScaler.scale(42),
                                        fontWeight: FontWeight.w800,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: w * 0.02,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Visibility(
                          visible: isAnalog,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              ...List.generate(
                                60,
                                (index) => Transform.rotate(
                                  angle: ((index * (pi * 2)) / 60),
                                  child: Divider(
                                    color: (index % 5 == 0)
                                        ? Colors.deepOrangeAccent.shade100
                                        : Colors.blue.shade400,
                                    thickness: (index % 5 == 0) ? 5 : 2,
                                    endIndent:
                                        (index % 5 == 0) ? w * 0.82 : w * 0.88,
                                  ),
                                ),
                              ),
                              Transform.rotate(
                                angle: pi / 2,
                                child: Transform.rotate(
                                  angle: (second * (pi * 2)) / 60,
                                  child: Container(
                                    height: h * 0.03,
                                    width: w * 0.65,
                                    // color: Colors.yellow,
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Seconds•••",
                                      style: TextStyle(
                                        color: Colors.pink.shade300,
                                        fontSize: textScaler.scale(20),
                                        letterSpacing: 2,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Transform.rotate(
                                angle: pi / 2,
                                child: Transform.rotate(
                                  angle:
                                      (minute + (second / 60)) * (pi * 2) / 60,
                                  child: Container(
                                    height: h * 0.03,
                                    width: w * 0.59,
                                    // color: Colors.yellow,
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Minutes••",
                                      style: TextStyle(
                                        color: Colors.yellow.shade300,
                                        fontSize: textScaler.scale(20),
                                        letterSpacing: 2,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Transform.rotate(
                                angle: pi / 2,
                                child: Transform.rotate(
                                  angle: (hour % 12 + (minute / 60)) *
                                      (pi * 2) /
                                      12,
                                  child: Container(
                                    height: h * 0.03,
                                    width: w * 0.52,
                                    // color: Colors.yellow,
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Hours••••",
                                      style: TextStyle(
                                        color: Colors.blue.shade300,
                                        fontSize: textScaler.scale(20),
                                        letterSpacing: 2,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              CircleAvatar(
                                radius: w * 0.02,
                                backgroundColor: Colors.indigo.shade900,
                              )
                            ],
                          ),
                        ),
                        Visibility(
                            visible: isStrap,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Transform.scale(
                                  scale: 9,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 1,
                                    value: second / 60,
                                    color: Colors.pink.shade300,
                                  ),
                                ),
                                Transform.scale(
                                  scale: 8,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 0.8,
                                    value: (minute + (second / 60)) / 60,
                                    color: Colors.yellow.shade300,
                                  ),
                                ),
                                Transform.scale(
                                  scale: 7,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 0.6,
                                    value: (hour % 12 + (minute / 60)) / 12,
                                    color: Colors.blue.shade300,
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "${(hour).toString().padLeft(2, '0')}:${(minute).toString().padLeft(2, '0')}:${(second).toString().padLeft(2, '0')}",
                                      style: TextStyle(
                                          fontSize: textScaler.scale(42),
                                          fontWeight: FontWeight.w800,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      "${(hour < 12) ? 'AM' : 'PM'}",
                                      style: TextStyle(
                                          fontSize: textScaler.scale(15),
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                        Visibility(
                          visible: isStop,
                          child: Column(
                            children: [
                              Container(
                                child: Text(
                                  "${(hh).toString().padLeft(2, '0')} : ${(mm).toString().padLeft(2, '0')} : ${(ss).toString().padLeft(2, '0')}",
                                  style: TextStyle(
                                      fontSize: textScaler.scale(45),
                                      color: Colors.white),
                                ),
                                padding: EdgeInsets.only(
                                    left: 16, right: 16, top: 8, bottom: 8),
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                              SizedBox(
                                height: h * 0.1,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ElevatedButton.icon(
                                    onPressed: () {
                                      if (!isOnTimer) {
                                        timerClock();
                                      }
                                      setState(() {});
                                    },
                                    icon: const Icon(
                                      Icons.play_arrow,
                                      color: Colors.black,
                                    ),
                                    label: const Text(
                                      "Start",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                  ElevatedButton.icon(
                                    onPressed: () {
                                      isOnTimer = false;
                                      timeHistory.add({
                                        'hour': hh,
                                        'minute': mm,
                                        'second': ss,
                                      });
                                      setState(() {});
                                    },
                                    icon: const Icon(
                                      Icons.stop,
                                      color: Colors.black,
                                    ),
                                    label: const Text(
                                      "Stop",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: h * 0.06,
                              ),
                              ElevatedButton.icon(
                                onPressed: () {
                                  hh = mm = ss = 0;
                                  isOnTimer = false;
                                  timeHistory = [];
                                  setState(() {});
                                },
                                icon: const Icon(
                                  Icons.restart_alt_outlined,
                                  color: Colors.black,
                                ),
                                label: const Text(
                                  "Restart",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
