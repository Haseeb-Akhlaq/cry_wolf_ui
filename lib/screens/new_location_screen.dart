import 'package:cry_wolf/screens/settingsDetail.dart';
import 'package:cry_wolf/styles/colors.dart';
import 'package:flutter/material.dart';

class Recipient {
  String? name;
  String? number;
  String? nickName;

  Recipient({this.name, this.nickName, this.number});
}

class NewLocationScreen extends StatefulWidget {
  @override
  _NewLocationScreenState createState() => _NewLocationScreenState();
}

class _NewLocationScreenState extends State<NewLocationScreen> {
  GlobalKey? actionKey;

  double? height, width, xPosition, yPosition;

  bool isDropdownOpened = false;

  OverlayEntry? floatingDropdown;

  List<Recipient> peoples = [];

  //THIS IS THE CONTACT LIST WHERE YOU CAN ADD MORE CONTACTS WHICH WILL APPEAR IN DIALOG

  List<Recipient> contacts = [
    Recipient(name: "James Walker", nickName: 'AW', number: '0334457862234'),
    Recipient(name: "James Charles", nickName: 'JC', number: '0334457862234'),
    Recipient(name: "Maria Sherepova", nickName: 'MS', number: '0334457862234'),
    Recipient(name: "Maria Sherepova", nickName: 'MS', number: '0334457862234'),
  ];

  bool location = false;
  bool home = false;
  bool star = true;
  bool heart = false;

  addPeoples(Recipient recipient) {
    final users = peoples.where((element) => element.name == recipient.name);
    print(users);

    FocusScope.of(context).unfocus();

    if (isDropdownOpened) {
      floatingDropdown!.remove();
      isDropdownOpened = !isDropdownOpened;
    }

    if (peoples.length == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SettingScreen(),
        ),
      );

      return;
    }

    if (users.isNotEmpty) {
      return;
    }
    setState(() {
      peoples.add(recipient);
    });
  }

  @override
  void initState() {
    actionKey = LabeledGlobalKey('98');
    super.initState();
  }

  void findDropdownData() {
    RenderBox renderBox =
        actionKey!.currentContext!.findRenderObject() as RenderBox;
    height = renderBox.size.height;
    width = renderBox.size.width;
    Offset offset = renderBox.localToGlobal(Offset.zero);
    xPosition = offset.dx;
    yPosition = offset.dy;
    print(height);
    print(width);
    print(xPosition);
    print(yPosition);
  }

  OverlayEntry _createFloatingDropdown() {
    return OverlayEntry(builder: (context) {
      return Positioned(
        left: xPosition,
        width: width,
        top: yPosition! + 40,
        height: 4 * 50 + 60,
        child: DropDown(
          itemHeight: height!,
          addRecipient: addPeoples,
          recipients: contacts,
        ),
      );
    });
  }

  AppBar getAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.background,
      centerTitle: true,
      title: Text(
        'New Location',
      ),
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
          if (isDropdownOpened) {
            floatingDropdown!.remove();
            isDropdownOpened = !isDropdownOpened;
          }
        },
        child: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
      ),
      actions: [
        TextButton(
          child: Text(
            'DONE',
            style: TextStyle(
              color: AppColors.secondary,
              fontWeight: FontWeight.bold,
              //fontFamily: 'sans-Bold',
            ),
          ),
          onPressed: () {},
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: GestureDetector(
        onTap: () {
          if (isDropdownOpened) {
            floatingDropdown!.remove();
            isDropdownOpened = !isDropdownOpened;
          }
        },
        child: Scaffold(
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
                    padding:
                        const EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: ListView(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Recipients',
                              style: TextStyle(
                                fontSize: 19,
                                letterSpacing: 1.5,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 20),
                            GestureDetector(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppColors.textFieldBackground,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 1),
                                  child: TextField(
                                    key: actionKey,
                                    onTap: () {
                                      setState(() {
                                        if (isDropdownOpened) {
                                          floatingDropdown!.remove();
                                        } else {
                                          findDropdownData();
                                          floatingDropdown =
                                              _createFloatingDropdown();
                                          Overlay.of(context)!
                                              .insert(floatingDropdown!);
                                        }

                                        isDropdownOpened = !isDropdownOpened;
                                      });
                                    },
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
                            ),
                            SizedBox(height: 25),
                            ...peoples.map<Widget>((e) => Column(
                                  children: [
                                    RecipientTile(recipient: e),
                                    SizedBox(height: 25),
                                  ],
                                )),
                            Text(
                              'Location Name',
                              style: TextStyle(
                                fontSize: 19,
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
                                    hintText: 'Gym',
                                    hintStyle: TextStyle(
                                      color: Color(0xff56757B),
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 25),
                            Text(
                              'Message',
                              style: TextStyle(
                                fontSize: 19,
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
                            Text(
                              'Choose an icon',
                              style: TextStyle(
                                fontSize: 19,
                                letterSpacing: 1.5,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 20),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      location = true;
                                      home = false;
                                      star = false;
                                      heart = false;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: location
                                          ? AppColors.secondary
                                          : Color(0xff294349),
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
                                ),
                                SizedBox(width: 15),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      location = false;
                                      home = true;
                                      star = false;
                                      heart = false;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: home
                                            ? AppColors.secondary
                                            : Color(0xff294349)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                        'assets/images/Home.png',
                                        height: 25,
                                        width: 25,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 15),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      location = false;
                                      home = false;
                                      star = true;
                                      heart = false;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: star
                                            ? AppColors.secondary
                                            : Color(0xff294349)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                        'assets/images/Star.png',
                                        height: 25,
                                        width: 25,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 15),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      location = false;
                                      home = false;
                                      star = false;
                                      heart = true;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: heart
                                            ? AppColors.secondary
                                            : Color(0xff294349)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                        'assets/images/Heart.png',
                                        height: 25,
                                        width: 25,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RecipientTile extends StatelessWidget {
  final Recipient? recipient;
  RecipientTile({this.recipient});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
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
                    recipient!.nickName.toString(),
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
                      recipient!.name.toString(),
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      recipient!.number.toString(),
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
                  child: Image.asset('assets/images/pencil.png'),
                ),
                SizedBox(width: 10),
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
    );
  }
}

class DropDown extends StatelessWidget {
  final itemHeight;
  final addRecipient;
  final List<Recipient>? recipients;

  DropDown({@required this.itemHeight, this.addRecipient, this.recipients});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 15,
        ),
        Align(
          alignment: Alignment(-0.8, 0),
          child: ClipPath(
            clipper: ArrowClipper(),
            child: Container(
              height: 10,
              width: 20,
              decoration: BoxDecoration(
                color: AppColors.textFieldBackground,
              ),
            ),
          ),
        ),
        Material(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: 4 * 55,
            width: 250,
            decoration: BoxDecoration(
              color: AppColors.textFieldBackground,
              borderRadius: BorderRadius.circular(8),
            ),
            child: ListView.separated(
              padding: EdgeInsets.only(top: 10),
              itemCount: recipients!.length,
              separatorBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: Divider(color: Color(0xff2A4951)),
                );
              },
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    addRecipient(recipients![index]);
                  },
                  child: DropDownItem(
                    text: recipients![index].name,
                    color: Color(0xff12C87B),
                    iconText: recipients![index].nickName,
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class DropDownItem extends StatelessWidget {
  final text;
  final color;
  final iconText;
  final bool isFirstItem;
  final bool isLastItem;

  const DropDownItem(
      {this.text,
      this.isFirstItem = false,
      this.isLastItem = false,
      this.iconText,
      this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.textFieldBackground,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        width: 220,
        child: Row(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color,
              ),
              child: Text(
                iconText,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Text(
                      '0334457862234',
                      style: TextStyle(
                        color: AppColors.textLight,
                        fontSize: 12,
                      ),
                    ),
                  ],
                )
              ],
            ),
            Spacer(),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Text(
                'Mobile',
                style: TextStyle(
                  color: AppColors.textLight,
                  fontSize: 10,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ArrowClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.moveTo(0, size.height);
    path.lineTo(size.width / 2, 0);
    path.lineTo(size.width, size.height);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class ArrowShape extends ShapeBorder {
  @override
  // TODO: implement dimensions
  EdgeInsetsGeometry get dimensions => throw UnimplementedError();

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    // TODO: implement getInnerPath
    throw UnimplementedError();
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    // TODO: implement getOuterPath
    return getClip(rect.size);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    // TODO: implement paint
  }

  @override
  ShapeBorder scale(double t) {
    // TODO: implement scale
    throw UnimplementedError();
  }

  Path getClip(Size size) {
    Path path = Path();

    path.moveTo(0, size.height);
    path.lineTo(size.width / 2, 0);
    path.lineTo(size.width, size.height);

    return path;
  }
}
