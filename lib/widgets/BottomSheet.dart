import 'dart:async';

import 'package:cry_wolf/screens/new_location_screen.dart';
import 'package:cry_wolf/styles/colors.dart';
import 'package:cry_wolf/widgets/stackImagesCircles.dart';
import 'package:flutter/material.dart';

class ModalBottomSheetDialog extends StatefulWidget {
  @override
  _ModalBottomSheetDialogState createState() => _ModalBottomSheetDialogState();
}

class _ModalBottomSheetDialogState extends State<ModalBottomSheetDialog> {
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
                        PeoplesCircles(
                          images: [
                            'assets/images/user1.jpg',
                            'assets/images/user2.jpg',
                            'assets/images/user3.jpeg',
                          ],
                        ),
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
