import 'dart:async';

import 'package:cry_wolf/screens/new_location_screen.dart';
import 'package:cry_wolf/screens/settingsDetail.dart';
import 'package:cry_wolf/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'locationDetailScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool switchValue = true;

  bottomSheet() {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        backgroundColor: Color(0xff1F363B),
        barrierColor: Color(0xff0E0D0D).withOpacity(0.96),
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Dialog();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      floatingActionButton: FloatingActionButton(
        child: Container(
          width: 60,
          height: 60,
          child: Icon(
            Icons.add,
            size: 25,
          ),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(colors: [
                Color(0xff851E74),
                Color(0xffB61282),
              ])),
        ),
        onPressed: () {
          bottomSheet();
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              UpperBar(),
              SizedBox(height: 25),
              Text(
                'SCHEDULED',
                style: TextStyle(
                  fontSize: 17,
                  letterSpacing: 1.5,
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LocationDetailScreen(),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xff3C6670),
                          Color(0xff1B3237),
                        ]),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: AppColors.secondary,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'assets/images/locationIcon.png',
                              height: 25,
                              width: 25,
                            ),
                          ),
                        ),
                        SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'GYM',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'You might wanna call emergency\nas I might have been injured...',
                            ),
                            SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 80,
                                      height: 35,
                                      child: Stack(
                                        children: [
                                          Container(
                                            child: CircleAvatar(
                                              radius: 16,
                                              backgroundImage: AssetImage(
                                                  'assets/images/user1.jpg'),
                                            ),
                                          ),
                                          Positioned(
                                            left: 20,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: AppColors
                                                      .textFieldBackground,
                                                  width: 1.5,
                                                ),
                                                shape: BoxShape.circle,
                                              ),
                                              child: CircleAvatar(
                                                radius: 15,
                                                backgroundImage: AssetImage(
                                                    'assets/images/user2.jpg'),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            left: 40,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: AppColors
                                                      .textFieldBackground,
                                                  width: 1.5,
                                                ),
                                                shape: BoxShape.circle,
                                              ),
                                              child: CircleAvatar(
                                                radius: 15,
                                                backgroundImage: AssetImage(
                                                    'assets/images/user3.jpeg'),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      '+2 more',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: AppColors.textLight,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.12),
                                CupertinoSwitch(
                                  activeColor: AppColors.secondary,
                                  value: switchValue,
                                  onChanged: (v) {
                                    setState(() {
                                      switchValue = !switchValue;
                                    });
                                  },
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Text(
                'PREPARED LOCATIONS',
                style: TextStyle(
                  fontSize: 17,
                  letterSpacing: 1.5,
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xff3C6670),
                        Color(0xff1B3237),
                      ]),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColors.secondary,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'assets/images/locationIcon.png',
                            height: 25,
                            width: 25,
                          ),
                        ),
                      ),
                      SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Home',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'You might wanna call emergency\nas I might have been injured...',
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Container(
                                width: 80,
                                height: 35,
                                child: Stack(
                                  children: [
                                    Container(
                                      child: CircleAvatar(
                                        radius: 16,
                                        backgroundImage: AssetImage(
                                            'assets/images/user1.jpg'),
                                      ),
                                    ),
                                    Positioned(
                                      left: 20,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color:
                                                AppColors.textFieldBackground,
                                            width: 1.5,
                                          ),
                                          shape: BoxShape.circle,
                                        ),
                                        child: CircleAvatar(
                                          radius: 15,
                                          backgroundImage: AssetImage(
                                              'assets/images/user2.jpg'),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 40,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color:
                                                AppColors.textFieldBackground,
                                            width: 1.5,
                                          ),
                                          shape: BoxShape.circle,
                                        ),
                                        child: CircleAvatar(
                                          radius: 15,
                                          backgroundImage: AssetImage(
                                              'assets/images/user3.jpeg'),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                '+2 more',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AppColors.textLight,
                                ),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xff3C6670),
                        Color(0xff1B3237),
                      ]),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColors.secondary,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'assets/images/locationIcon.png',
                            height: 25,
                            width: 25,
                          ),
                        ),
                      ),
                      SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'GYM',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'You might wanna call emergency\nas I might have been injured...',
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Container(
                                width: 80,
                                height: 35,
                                child: Stack(
                                  children: [
                                    Container(
                                      child: CircleAvatar(
                                        radius: 16,
                                        backgroundImage: AssetImage(
                                            'assets/images/user1.jpg'),
                                      ),
                                    ),
                                    Positioned(
                                      left: 20,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color:
                                                AppColors.textFieldBackground,
                                            width: 1.5,
                                          ),
                                          shape: BoxShape.circle,
                                        ),
                                        child: CircleAvatar(
                                          radius: 15,
                                          backgroundImage: AssetImage(
                                              'assets/images/user2.jpg'),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 40,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color:
                                                AppColors.textFieldBackground,
                                            width: 1.5,
                                          ),
                                          shape: BoxShape.circle,
                                        ),
                                        child: CircleAvatar(
                                          radius: 15,
                                          backgroundImage: AssetImage(
                                              'assets/images/user3.jpeg'),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                '+2 more',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AppColors.textLight,
                                ),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

class Dialog extends StatefulWidget {
  @override
  _DialogState createState() => _DialogState();
}

class _DialogState extends State<Dialog> {
  Timer? _timer;
  int _start = 300;

  String timeFormatter(int time) {
    Duration duration = Duration(seconds: time.round());

    return [duration.inMinutes, duration.inSeconds]
        .map((seg) => seg.remainder(60).toString().padLeft(2, '0'))
        .join(':');
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 470,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 15),
                Container(
                  height: 100,
                  width: 100,
                  child: Image.asset('assets/images/messageIcon.png'),
                ),
                Text(
                  'Upcoming Cry Wolf Message',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 25),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xff274248),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'GYM',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'You might wanna call emergency\n  as I might have been injured...',
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 80,
                              height: 35,
                              child: Stack(
                                children: [
                                  Container(
                                    child: CircleAvatar(
                                      radius: 14,
                                      backgroundImage:
                                          AssetImage('assets/images/user1.jpg'),
                                    ),
                                  ),
                                  Positioned(
                                    left: 20,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: AppColors.textFieldBackground,
                                          width: 1.5,
                                        ),
                                        shape: BoxShape.circle,
                                      ),
                                      child: CircleAvatar(
                                        radius: 13,
                                        backgroundImage: AssetImage(
                                            'assets/images/user2.jpg'),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 40,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: AppColors.textFieldBackground,
                                          width: 1.5,
                                        ),
                                        shape: BoxShape.circle,
                                      ),
                                      child: CircleAvatar(
                                        radius: 13,
                                        backgroundImage: AssetImage(
                                            'assets/images/user3.jpeg'),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              '+2 more',
                              style: TextStyle(
                                fontSize: 11,
                                color: AppColors.textLight,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'This message will be sent in  ',
                      style: TextStyle(fontSize: 12),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 3.0),
                      child: Text(
                        '${timeFormatter(_start)}',
                        style:
                            TextStyle(color: AppColors.secondary, fontSize: 13),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 17),
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    alignment: Alignment.center,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(
                          0xffFF6464,
                        ),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      'Deactivate',
                      style: TextStyle(
                        color: Color(
                          0xffFF6464,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewLocationScreen(),
                        ),
                      );
                    },
                    child: Container(
                        height: 50,
                        alignment: Alignment.center,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            Color(0xff851E74),
                            Color(0xffB61282),
                          ]),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text('Next')),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class UpperBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi Farazleo',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'We got you covered!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
        Row(
          children: [
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Image.asset(
                    'assets/images/starCircle.png',
                    fit: BoxFit.fill,
                    height: 75,
                    width: 75,
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 15,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(colors: [
                        Color(0xff851E74),
                        Color(0xffB61282),
                      ]),
                    ),
                    child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Text(
                          '2',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        )),
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingScreen(),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.textFieldBackground,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/images/settingIcon.png',
                    height: 25,
                    width: 25,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
