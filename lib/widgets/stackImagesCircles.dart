import 'package:cry_wolf/styles/colors.dart';
import 'package:flutter/material.dart';

class PeoplesCircles extends StatelessWidget {
  final List? images;
  PeoplesCircles({this.images});
  @override
  Widget build(BuildContext context) {
    int count = -1;
    return Row(
      children: [
        Container(
          width: images!.length * 25,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.textFieldBackground,
                    width: 1.5,
                  ),
                  shape: BoxShape.circle,
                ),
                child: CircleAvatar(
                  radius: 15,
                  backgroundImage: AssetImage('assets/images/user1.jpg'),
                ),
              ),
              ...images!.map((e) {
                count++;
                return Positioned(
                  left: (21 * count).toDouble(),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.textFieldBackground,
                        width: 1.5,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: CircleAvatar(
                      radius: 15,
                      backgroundImage: AssetImage(e),
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
        if (images!.length >= 3)
          Text(
            '  +2 more',
            style: TextStyle(
              fontSize: 12,
              color: AppColors.textLight,
            ),
          )
      ],
    );
  }
}
