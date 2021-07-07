import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

List imgList = [];

class ImageSliderDemo extends StatelessWidget {
  ImageSliderDemo({@required this.fit, @required this.aspectRatio, @required this.images}) {
    imgList = images;
  }

  final BoxFit fit;
  final double aspectRatio;
  final List images;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider(
        options: CarouselOptions(
          aspectRatio: aspectRatio,
          enlargeCenterPage: true,
          viewportFraction: 1,
        ),
        items: imgList
            .map((item) => Container(
                  child: Image.network(
                    item,
                    fit: fit,
                    width: 1000,
                  ),
                ))
            .toList(),
      ),
    );
  }
}

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                child: Stack(
                  children: <Widget>[
                    Image.network(
                      item,
                      scale: 50,
                      fit: BoxFit.cover,
                      width: 1000.0,
                    ),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color.fromARGB(200, 0, 0, 0), Color.fromARGB(0, 0, 0, 0)],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20.0),
                        child: Text(
                          'No. ${imgList.indexOf(item)} image',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ))
    .toList();
