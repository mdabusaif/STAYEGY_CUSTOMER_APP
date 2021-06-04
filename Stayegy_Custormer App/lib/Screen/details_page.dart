import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stayegy/Screen/bookingConfirm_page.dart';
import 'package:stayegy/bloc/Repository/Hotels/HotelDetails.dart';
import 'package:stayegy/constants/ConstantLists.dart';
import 'package:intl/intl.dart';
import 'package:stayegy/container/SnackBar.dart';
import 'package:stayegy/container/gradient_creation.dart';
import 'package:stayegy/container/slider.dart';

class DetailsPage extends StatefulWidget {
  final Hotel hotelInt;

  DetailsPage({@required this.hotelInt});

  @override
  _DetailsPageState createState() => _DetailsPageState(hotel: hotelInt);
}

class _DetailsPageState extends State<DetailsPage> {
  int valueChoose;
  String roomType1, roomType2, roomType3;

  int totalPrice;
  int totalDiscountedPrice;

  bool isConfirmed = false;

  final Hotel hotel;

  _DetailsPageState({@required this.hotel});

  DateTimeRange timeRange = DateTimeRange(start: DateTime.now(), end: DateTime.now().add(Duration(days: 1)));

  dateTimeRangePicker() async {
    DateTimeRange picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day),
      lastDate: DateTime(DateTime.now().year + 1),
      initialDateRange: DateTimeRange(
        end: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 1),
        start: DateTime.now(),
      ),
    );
    setState(() {
      timeRange = picked;
    });
    print(picked);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF0F0F0),
      body: Stack(
        children: [
          CustomScrollView(slivers: [
            SliverAppBar(
                floating: false,
                pinned: false,
                expandedHeight: 350,
                flexibleSpace: Container(
                  color: Colors.grey,
                  height: 500,
                  width: double.infinity,
                  //todo: Imageslider for showing images
                  // child: ImageSliderDemo(
                  //     fit: BoxFit.cover,
                  //     aspectRatio: 1,
                  //     images: hotel.images.values.toList()),
                ),
                leading: IconButton(
                  padding: EdgeInsets.only(right: 10),
                  iconSize: 5,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    CupertinoIcons.back,
                    color: Colors.white,
                    size: 30,
                  ),
                )),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Column(
                    children: [
                      Container(
                        height: 80,
                        color: Colors.white,
                        child: Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Text(
                                // 'STAYEGY 2483 HOTEL RADISSON',
                                '${hotel.hid} ${hotel.name}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                '${hotel.address}',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        padding: EdgeInsets.only(left: 20, right: 20),
                        color: Colors.white,
                        height: 100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Date of Travel',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                                color: Colors.black,
                                height: 50,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        dateTimeRangePicker();
                                      },
                                      child: Text(
                                        // '${timeRange.start.day.toString()}-${timeRange.end.day.toString()}',
                                        '${DateFormat('dd-MM-yy').format(timeRange.start)}  -  ${DateFormat('dd-MM-yy').format(timeRange.end)}',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                    VerticalDivider(
                                      color: Color(0xffd7d7d7),
                                      thickness: 1,
                                      indent: 10,
                                      endIndent: 15,
                                    ),
                                    GestureDetector(
                                      child: Text(
                                        "Room",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                        ),
                                      ),
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return StatefulBuilder(builder: (context, setState) {
                                                return AlertDialog(
                                                  buttonPadding: EdgeInsets.only(left: 0),
                                                  scrollable: true,
                                                  title: Center(
                                                    child: Text(
                                                      'ROOM SELECTION',
                                                      style: TextStyle(fontWeight: FontWeight.bold),
                                                    ),
                                                  ),
                                                  content: Form(
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      children: <Widget>[
                                                        Container(
                                                          width: double.infinity,
                                                          color: Color(0xffefefef),
                                                          child: DropdownButtonHideUnderline(
                                                            child: DropdownButton(
                                                              hint: Padding(
                                                                padding: const EdgeInsets.all(8.0),
                                                                child: Text(
                                                                  'Number of Rooms',
                                                                  style: GoogleFonts.roboto(
                                                                    fontSize: 15,
                                                                    color: Colors.black54,
                                                                  ),
                                                                ),
                                                              ),
                                                              dropdownColor: Color(0xffefefef),
                                                              isExpanded: false,
                                                              style: TextStyle(
                                                                color: Colors.black,
                                                                fontSize: 22,
                                                              ),
                                                              value: valueChoose,
                                                              onChanged: (newValue) {
                                                                setState(() {
                                                                  valueChoose = newValue;
                                                                });
                                                              },
                                                              items: noOfRoomList.map((valueItem) {
                                                                return DropdownMenuItem(
                                                                  value: valueItem,
                                                                  child: Container(
                                                                    alignment: Alignment.centerRight,
                                                                    width: 150,
                                                                    child: Text(
                                                                      valueItem.toString(),
                                                                      textAlign: TextAlign.center,
                                                                      style: GoogleFonts.roboto(
                                                                        fontSize: 17,
                                                                        fontWeight: FontWeight.normal,
                                                                        color: Colors.black54,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              }).toList(),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Container(
                                                          height: 200,
                                                          // width: MediaQuery.of(context).size.width,
                                                          width: double.maxFinite,
                                                          alignment: Alignment.centerLeft,
                                                          child: ListView.builder(
                                                            shrinkWrap: true,
                                                            itemCount: valueChoose == null ? 0 : valueChoose,
                                                            itemBuilder: (context, index) {
                                                              return ListTile(
                                                                title: Container(
                                                                  width: double.infinity,
                                                                  color: Color(0xffefefef),
                                                                  child: DropdownButtonHideUnderline(
                                                                    child: DropdownButton(
                                                                      hint: Padding(
                                                                        padding: const EdgeInsets.all(8.0),
                                                                        child: Text(
                                                                          'Select Room Type',
                                                                          textAlign: TextAlign.center,
                                                                          style: GoogleFonts.roboto(fontSize: 15),
                                                                        ),
                                                                      ),
                                                                      dropdownColor: Color(0xffefefef),
                                                                      isExpanded: false,
                                                                      style: TextStyle(
                                                                        color: Colors.black,
                                                                        fontSize: 22,
                                                                      ),
                                                                      value: index == 0
                                                                          ? roomType1
                                                                          : index == 1
                                                                              ? roomType2
                                                                              : roomType3,
                                                                      onChanged: (newValue) {
                                                                        setState(() {
                                                                          if (index == 0) {
                                                                            roomType1 = newValue;
                                                                          } else if (index == 1) {
                                                                            roomType2 = newValue;
                                                                          } else if (index == 2) {
                                                                            roomType3 = newValue;
                                                                          }
                                                                        });
                                                                      },
                                                                      items: hotel.discountedPrice.keys.map((valueItem) {
                                                                        return DropdownMenuItem(
                                                                          value: valueItem,
                                                                          child: Center(
                                                                            child: LimitedBox(
                                                                              maxWidth: 200,
                                                                              child: Container(
                                                                                width: double.maxFinite,
                                                                                alignment: Alignment.center,
                                                                                child: Text(
                                                                                  valueItem,
                                                                                  textAlign: TextAlign.center,
                                                                                  style: GoogleFonts.roboto(
                                                                                    fontSize: 15,
                                                                                    fontWeight: FontWeight.normal,
                                                                                    color: Colors.black54,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }).toList(),
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Center(
                                                          child: Text(
                                                            'Age less than 5 will not considered as a person',
                                                            style: TextStyle(fontSize: 12, color: Colors.grey),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  actions: [
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 0, right: 0),
                                                      child: GestureDetector(
                                                          child: Container(
                                                              height: 50,
                                                              width: double.maxFinite,
                                                              color: Colors.black,
                                                              alignment: Alignment.center,
                                                              child: Text(
                                                                "CONFIRM",
                                                                style: TextStyle(
                                                                  fontWeight: FontWeight.bold,
                                                                  color: Colors.white,
                                                                ),
                                                              )),
                                                          onTap: () {
                                                            switch (valueChoose) {
                                                              case 1:
                                                                if (roomType1 != null) {
                                                                  totalDiscountedPrice = hotel.discountedPrice[roomType1];
                                                                  totalPrice = hotel.price[roomType1];
                                                                  isConfirmed = true;
                                                                } else {
                                                                  SnackBarBuilder().buildSnackBar(
                                                                    context,
                                                                    message: "Room Type Not Selected!",
                                                                    color: Colors.red,
                                                                  );
                                                                }
                                                                break;
                                                              case 2:
                                                                if (roomType1 != null && roomType2 != null) {
                                                                  totalDiscountedPrice = hotel.discountedPrice[roomType1] + hotel.discountedPrice[roomType2];
                                                                  totalPrice = hotel.price[roomType1] + hotel.price[roomType2];
                                                                  isConfirmed = true;
                                                                } else {
                                                                  SnackBarBuilder().buildSnackBar(
                                                                    context,
                                                                    message: "Room Type Not Selected!",
                                                                    color: Colors.red,
                                                                  );
                                                                }
                                                                break;
                                                              case 3:
                                                                if (roomType1 != null && roomType2 != null && roomType3 != null) {
                                                                  totalDiscountedPrice = hotel.discountedPrice[roomType1] + hotel.discountedPrice[roomType2] + hotel.discountedPrice[roomType3];
                                                                  totalPrice = hotel.price[roomType1] + hotel.price[roomType2] + hotel.price[roomType3];
                                                                  isConfirmed = true;
                                                                } else {
                                                                  SnackBarBuilder().buildSnackBar(
                                                                    context,
                                                                    message: "Room Type Not Selected!",
                                                                    color: Colors.red,
                                                                  );
                                                                }
                                                                break;
                                                              default:
                                                                SnackBarBuilder().buildSnackBar(
                                                                  context,
                                                                  message: "Room Selection Error!",
                                                                  color: Colors.red,
                                                                );
                                                            }

                                                            if (isConfirmed) {
                                                              Navigator.pop(context);
                                                            }
                                                          }),
                                                    )
                                                  ],
                                                );
                                              });
                                            }).then((_) => setState(() {
                                              totalDiscountedPrice = totalDiscountedPrice;
                                              totalPrice = totalPrice;
                                            }));
                                      },
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        padding: EdgeInsets.only(left: 20, right: 20, top: 5),
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Facilities',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.start,
                            ),
                            LimitedBox(
                              maxHeight: 400,
                              child: Padding(
                                padding: EdgeInsets.only(top: 0, bottom: 2, left: 0, right: 10),
                                child: GridView.count(
                                  primary: false,
                                  padding: EdgeInsets.only(
                                    top: 10,
                                  ),
                                  childAspectRatio: 4,
                                  crossAxisCount: 3,
                                  shrinkWrap: true,
                                  children: List.generate(hotel.facilities.length, (index) {
                                    return Text(
                                      '${hotel.facilities[index]}',
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    );
                                  }),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      /// Todo: company rules text area!!
                      Container(
                        height: 500,
                        color: Colors.white54,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ]),
          Positioned(
            bottom: 0.0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 24,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    totalDiscountedPrice == null || totalDiscountedPrice == 0 ? '৳${hotel.discountedPrice["Single | Non AC"]} ' : '৳$totalDiscountedPrice ',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    totalPrice == null || totalPrice == 0 ? '৳${hotel.price["Single | Non AC"]}' : '৳$totalPrice ',
                                    style: TextStyle(
                                      fontSize: 20,
                                      decoration: TextDecoration.lineThrough,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              'Total Amount',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // SizedBox(
                      //   width: 120,
                      // ),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                insetPadding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                                title: Center(
                                  child: Text(
                                    'Rules To Maintain',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                content: Container(
                                  height: MediaQuery.of(context).size.height,
                                  width: MediaQuery.of(context).size.width,
                                ),
                                actions: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 0, right: 0),
                                    child: GestureDetector(
                                        child: Container(
                                          height: 50,
                                          width: double.infinity,
                                          color: Colors.black,
                                          alignment: Alignment.center,
                                          child: GradientCreate(
                                            child: Text(
                                              "CONFIRM",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.push(context, CupertinoPageRoute(builder: (_) => BookingConfirmPage()));
                                          // your code
                                        }),
                                  )
                                ],
                              );
                            },
                          );
                        },
                        child: Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width / 3,
                          alignment: Alignment.center,
                          color: Colors.black,
                          child: GradientCreate(
                            child: Text(
                              'Book Now',
                              style: GoogleFonts.roboto(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'By Proceeding you are accepting all our Terms and Privacy Policy',
                    style: TextStyle(color: Colors.grey, fontSize: 10),
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
