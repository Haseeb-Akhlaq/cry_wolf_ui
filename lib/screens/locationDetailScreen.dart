import 'package:cry_wolf/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LocationDetailScreen extends StatefulWidget {
  @override
  _LocationDetailScreenState createState() => _LocationDetailScreenState();
}

class _LocationDetailScreenState extends State<LocationDetailScreen> {
  bool min5 = false;
  bool min10 = false;
  bool min30 = true;
  bool hr1 = false;

  getAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.background,
      centerTitle: true,
      title: Text(
        'GYM',
      ),
      actions: [
        Container(
          margin: EdgeInsets.only(right: 15),
          width: 30,
          height: 30,
          child: Image.asset('assets/images/menuIcon.png'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: getAppBar(),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              child: Image.asset(
                'assets/images/Vector 4.png',
                width: MediaQuery.of(context).size.width,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height -
                  getAppBar().preferredSize.height -
                  MediaQuery.of(context).padding.top,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: ListView(
                  children: [
                    SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Recipients',
                          style: TextStyle(
                            fontSize: 18,
                            letterSpacing: 1.5,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.textFieldBackground,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 1),
                            child: TextField(
                              style: TextStyle(color: Colors.white),
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Type a name or number...',
                                hintStyle: TextStyle(
                                  color: Color(0xff56757B),
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 25),
                        CustomMessageContainer(
                          name: 'Alan Walker',
                          nickName: 'AW',
                        ),
                        SizedBox(height: 25),
                        CustomMessageContainer(
                          name: 'James Charles',
                          nickName: 'JC',
                        ),
                        SizedBox(height: 25),
                        Text(
                          'Message',
                          style: TextStyle(
                            fontSize: 18,
                            letterSpacing: 1.5,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.textFieldBackground,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 1),
                            child: TextField(
                              maxLines: 4,
                              style: TextStyle(color: Colors.white),
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'message',
                                hintStyle: TextStyle(
                                  color: Color(0xff56757B),
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 35),
                        ListTile(
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: AppColors.secondary,
                            size: 25,
                          ),
                          minLeadingWidth: 0,
                          contentPadding: EdgeInsets.all(0),
                          leading: Container(
                            height: 30,
                            width: 30,
                            child: Image.asset('assets/images/lock.png'),
                          ),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Attach your location to message',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 10),
                            ],
                          ),
                          subtitle: Text(
                            'Available in PREMIUM',
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.secondary,
                            ),
                          ),
                        ),
                        SizedBox(height: 25),
                        Text(
                          'Message Delay',
                          style: TextStyle(
                            fontSize: 18,
                            letterSpacing: 1.5,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  min5 = true;
                                  min10 = false;
                                  min30 = false;
                                  hr1 = false;
                                });
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.2,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: min5
                                      ? AppColors.secondary
                                      : AppColors.textFieldBackground,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 8.0,
                                    horizontal: 5,
                                  ),
                                  child: Text(
                                    '5 min',
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.04),
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  min5 = false;
                                  min10 = true;
                                  min30 = false;
                                  hr1 = false;
                                });
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.2,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: min10
                                      ? AppColors.secondary
                                      : AppColors.textFieldBackground,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 8.0,
                                    horizontal: 1,
                                  ),
                                  child: Text(
                                    '10 min',
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.04),
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  min5 = false;
                                  min10 = false;
                                  min30 = true;
                                  hr1 = false;
                                });
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.2,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: min30
                                      ? AppColors.secondary
                                      : AppColors.textFieldBackground,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 8.0,
                                    horizontal: 1,
                                  ),
                                  child: Text(
                                    '30 min',
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.04),
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  min5 = false;
                                  min10 = false;
                                  min30 = false;
                                  hr1 = true;
                                });
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.2,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: hr1
                                      ? AppColors.secondary
                                      : AppColors.textFieldBackground,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 8.0,
                                    horizontal: 1,
                                  ),
                                  child: Text(
                                    '1 hr',
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.04),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 35),
                        Container(
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
                            child: Text(
                              'Cry Wolf!',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                        SizedBox(height: 35),
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

class CustomMessageContainer extends StatefulWidget {
  final name;
  final nickName;

  const CustomMessageContainer({this.name, this.nickName});

  @override
  _CustomMessageContainerState createState() => _CustomMessageContainerState();
}

class _CustomMessageContainerState extends State<CustomMessageContainer> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          color: Color(0xff274248),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xff3F636B),
                    ),
                    child: Text(
                      widget.nickName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        '0334457652243',
                        style: TextStyle(
                          fontSize: 13,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    height: 25,
                    width: 25,
                    child: Image.asset('assets/images/bin.png'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      pressed
          ? Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
                color: AppColors.textFieldBackground,
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('CUSTOM MESSAGE'),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Some Custom Message text'),
                        Container(
                          height: 25,
                          width: 25,
                          child: Image.asset('assets/images/pencil.png'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          : GestureDetector(
              onTap: () {
                setState(() {
                  pressed = true;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                  gradient: LinearGradient(colors: [
                    Color(0xff67BBEA),
                    Color(0xff3286D3),
                  ]),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 30,
                        width: 20,
                        child: Image.asset('assets/images/lock.png'),
                      ),
                      Text(
                        '   Add Custom Message',
                      ),
                    ],
                  ),
                ),
              ),
            ),
    ]);
  }
}
