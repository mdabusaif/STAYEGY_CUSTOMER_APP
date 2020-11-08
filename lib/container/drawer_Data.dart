import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class drawer_data extends StatelessWidget {
  drawer_data(
      {@required this.imagePath,
      @required this.textData,
      @required this.onTap,
      this.width});

  final String imagePath;
  final String textData;
  final GestureTapCallback onTap;
  double width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: 50),
        child: Row(
          children: <Widget>[
            Image.asset(
              imagePath,
              scale: 2.3,
            ),
            SizedBox(
              width: width == null ? width = 20 : width,
            ),
            Text(
              textData,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
