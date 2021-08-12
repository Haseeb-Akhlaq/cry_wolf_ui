import 'dart:ui';

import 'package:cry_wolf/screens/settingsDetail.dart';
import 'package:cry_wolf/styles/colors.dart';
import 'package:cry_wolf/widgets/BottomSheet.dart';
import 'package:cry_wolf/widgets/preparedLocations.dart';
import 'package:cry_wolf/widgets/stackImagesCircles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'locationDetailScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool modalSheetOpened = false;

  bottomSheet() {
    showModalBottomSheet(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        backgroundColor: Color(0xff1F363B),
        barrierColor: Color(0xff0E0D0D).withOpacity(0.5),
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return ModalBottomSheetDialog();
        }).then((value) {
      setState(() {
        modalSheetOpened = false;
      });
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
          setState(() {
            modalSheetOpened = true;
          });
          bottomSheet();
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Stack(
            children: [
              Column(
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
                    child: SchedulesLocations(),
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
                  PreparedLocations(locationName: 'Home'),
                  SizedBox(height: 20),
                  PreparedLocations(locationName: 'Gym'),
                  SizedBox(height: 30),
                ],
              ),
              if (modalSheetOpened)
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: double.infinity,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class SchedulesLocations extends StatelessWidget {
  const SchedulesLocations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    PeoplesCircles(
                      images: [
                        'assets/images/user1.jpg',
                        'assets/images/user2.jpg',
                        'assets/images/user3.jpeg',
                      ],
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                    Container(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.width * 0.015),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(
                            0xffFF6464,
                          ),
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        'Deactivate',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.03,
                          color: Color(
                            0xffFF6464,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
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
                  top: 13,
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
                        padding: const EdgeInsets.only(
                            top: 3, left: 6, right: 5, bottom: 6),
                        child: Text(
                          '2',
                          textAlign: TextAlign.center,
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
