import 'package:cry_wolf/styles/colors.dart';
import 'package:cry_wolf/widgets/stackImagesCircles.dart';
import 'package:flutter/cupertino.dart';

class PreparedLocations extends StatelessWidget {
  final locationName;
  PreparedLocations({this.locationName});

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
                  locationName,
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

                //ADD MORE IMAGES LINK IT WILL AUTOMATICALLY APPEAR IN THE IMAGES CIRCLES
                PeoplesCircles(
                  images: [
                    'assets/images/user1.jpg',
                    'assets/images/user2.jpg',
                    'assets/images/user3.jpeg',
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
