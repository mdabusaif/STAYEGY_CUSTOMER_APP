import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stayegy/UI/details_page.dart';
import 'package:stayegy/container/slider.dart';

class CardModel extends StatelessWidget {
  final String hid;
  final String name;
  final String address;
  final String price;
  final Map images;

  CardModel(
      {@required this.hid,
      @required this.name,
      @required this.address,
      @required this.price,
      @required this.images});

  @override
  Widget build(BuildContext context) {
    return Card(
      //clipBehavior: Clip.hardEdge,
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: () {
          print('Card Pressed!');
          Navigator.push(
            context,
            CupertinoPageRoute(builder: (context) => details_page()),
          );
        },
        child: Container(
          height: 350,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 4,
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                  child: ImageSliderDemo(
                    fit: BoxFit.cover,
                    aspectRatio: 16 / 9,
                    images: images.values.toList(),
                  ),
                  // child: Container(
                  //   color: Colors.grey,
                  // ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                        // 'STAYEGY 7350 Hotel Rajsthan',
                        '$hid $name',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        // 'Puraton Bus Stand, Faridpur',
                        '$address',
                        style: TextStyle(
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        children: <Widget>[
                          Text(
                            // '৳ 400',
                            '৳ $price',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            '500',
                            style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            '20% OFF',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
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
    );
  }
}
