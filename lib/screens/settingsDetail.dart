import 'package:cry_wolf/styles/colors.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  int notificationTime = 5;
  int timeFormat = 12;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.background,
        centerTitle: true,
        title: Text(
          'Settings',
        ),
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              'assets/images/Vector 4.png',
              //color: Color(0xff49183F).withOpacity(0.85),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: ListView(
                children: [
                  SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(colors: [
                        Color(0xff851E74),
                        Color(0xffB61282),
                      ]),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 5,
                      ),
                      child: ListTile(
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                          size: 25,
                        ),
                        minLeadingWidth: 0,
                        contentPadding: EdgeInsets.all(0),
                        leading: Container(
                          alignment: Alignment.center,
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xffB4349A),
                          ),
                          child: Image.asset(
                            'assets/images/flash.png',
                            height: 25,
                            width: 25,
                          ),
                        ),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'GO PREMIUM!',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 5),
                          ],
                        ),
                        subtitle: Text(
                          'Unlock customized messaging etc...',
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      Text(
                        'General',
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.secondary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      PopupMenuButton(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Reminder notification time for upcoming scheduled message',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              '$notificationTime min',
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColors.textLight,
                              ),
                            ),
                          ],
                        ),
                        itemBuilder: (content) => [
                          PopupMenuItem(
                            value: 5,
                            child: Text("5 min"),
                          ),
                          PopupMenuItem(
                            value: 10,
                            child: Text("10 min"),
                          ),
                          PopupMenuItem(
                            value: 30,
                            child: Text("30 min"),
                          ),
                        ],
                        onSelected: (int v) {
                          setState(() {
                            notificationTime = v;
                          });
                        },
                      ),
                      SizedBox(height: 12),
                      Divider(color: AppColors.textLight),
                      SizedBox(height: 12),
                      PopupMenuButton(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Time Format',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              '$timeFormat h',
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColors.textLight,
                              ),
                            ),
                          ],
                        ),
                        itemBuilder: (content) => [
                          PopupMenuItem(
                            value: 12,
                            child: Text("12h"),
                          ),
                          PopupMenuItem(
                            value: 24,
                            child: Text("24h"),
                          ),
                        ],
                        onSelected: (int v) {
                          setState(() {
                            timeFormat = v;
                          });
                        },
                      ),
                      SizedBox(height: 12),
                      Divider(color: AppColors.textLight),
                      SizedBox(height: 12),
                      Text(
                        'Notification Sound',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Default',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.textLight,
                        ),
                      ),
                      SizedBox(height: 25),
                      Text(
                        'About',
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.secondary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ListTile(
                        onTap: () {},
                        minLeadingWidth: 0,
                        contentPadding: EdgeInsets.all(0),
                        title: Container(
                          margin: EdgeInsets.only(bottom: 2),
                          child: Text(
                            'Cry Wolf',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ),
                        subtitle: Text(
                          'Version 0.0.1',
                          style: TextStyle(
                              color: AppColors.textLight, fontSize: 12),
                        ),
                        leading: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color(0xff294349)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'assets/images/fi_info.png',
                              height: 25,
                              width: 25,
                            ),
                          ),
                        ),
                      ),
                      Divider(color: AppColors.textLight),
                      ListTile(
                        onTap: () {},
                        minLeadingWidth: 0,
                        contentPadding: EdgeInsets.all(0),
                        title: Container(
                          margin: EdgeInsets.only(bottom: 2),
                          child: Text(
                            'Privacy Policy',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ),
                        leading: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color(0xff294349)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'assets/images/Vector.png',
                              height: 25,
                              width: 25,
                            ),
                          ),
                        ),
                      ),
                      Divider(color: AppColors.textLight),
                      ListTile(
                        onTap: () {},
                        minLeadingWidth: 0,
                        contentPadding: EdgeInsets.all(0),
                        title: Container(
                          margin: EdgeInsets.only(bottom: 2),
                          child: Text(
                            'Help & Support',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ),
                        leading: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color(0xff294349)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'assets/images/messages-2.png',
                              height: 25,
                              width: 25,
                            ),
                          ),
                        ),
                      ),
                      Divider(color: AppColors.textLight),
                      ListTile(
                        onTap: () {},
                        minLeadingWidth: 0,
                        contentPadding: EdgeInsets.all(0),
                        title: Container(
                          margin: EdgeInsets.only(bottom: 2),
                          child: Text(
                            'Rate our app',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ),
                        subtitle: Text(
                          'Makes us happy!',
                          style: TextStyle(
                              color: AppColors.textLight, fontSize: 12),
                        ),
                        leading: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color(0xff294349)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'assets/images/like.png',
                              height: 25,
                              width: 25,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 80),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
