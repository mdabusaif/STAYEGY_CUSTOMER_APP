import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stayegy/Screen/details_page.dart';
import 'package:stayegy/bloc/Repository/Hotels/HotelDetails.dart';

import 'package:stayegy/container/slider.dart';

class CardModel extends StatelessWidget {
  final Hotel hotel;

  CardModel({@required this.hotel});

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
              CupertinoPageRoute(
                  builder: (context) => DetailsPage(
                        hotelInt: hotel,
                      )));
        },
        child: Container(
          height: 350,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 4,
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                  //todo: imageslider to show images
                  // child: ImageSliderDemo(
                  //   fit: BoxFit.cover,
                  //   aspectRatio: 16 / 9,
                  //   images: hotel.images.values.toList(),
                  // ),

                  child: ExtendedImage.network(
                    hotel.images[0],
                    fit: BoxFit.cover,
                    cache: true,
                  ),
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
                        '${hotel.hid} ${hotel.name}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        // 'Puraton Bus Stand, Faridpur',
                        '${hotel.address}',
                        style: TextStyle(
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        //crossAxisAlignment: CrossAxisAlignment.baseline,
                        children: <Widget>[
                          Text(
                            // '৳ 400',
                            '৳ ${hotel.discountedPrice["Single | Non AC"]}',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            '৳ ${hotel.price["Single | Non AC"]}',
                            style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            '${(((hotel.price["Single | Non AC"] - hotel.discountedPrice["Single | Non AC"]) / hotel.price["Single | Non AC"]) * 100).toInt()}% OFF',
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
