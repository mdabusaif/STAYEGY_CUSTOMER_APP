import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stayegy/Screen/thankyou_page.dart';
import 'package:stayegy/bloc/LoadingBloc/loadingbloc_bloc.dart';
import 'package:stayegy/bloc/Repository/Booking/BookingDetails.dart';
import 'package:stayegy/container/bottom_button.dart';
import 'package:intl/intl.dart';
import 'package:stayegy/container/gradient_creation.dart';
import 'package:stayegy/container/loading_Overlay.dart';

class BookingConfirmPage extends StatelessWidget {
  BookingConfirmPage({
    @required this.bookingDetails,
  });

  final BookingDetails bookingDetails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.close,
            color: Colors.black,
          ),
        ),
        elevation: 0.5,
        centerTitle: true,
        title: Image.asset(
          'images/stayegy gold logo.png',
          scale: 3,
          fit: BoxFit.fill,
        ),
        backgroundColor: Colors.white,
      ),
      body: BlocListener<LoadingBloc, LoadingBlocState>(
          listener: (context, state) {
            if (state is BookingRequestPlacedState) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => ThankYouPage(
                            bookingId: state.bookingID,
                          )));
            } else if (state is ProcessingState) {
              LoadingOverlay().buildOverlay(context);
            }
          },
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      children: [
                        //Information part start
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 40,
                            ),
                            RichText(
                              text: TextSpan(
                                  text: 'Thank you ',
                                  style: TextStyle(
                                    color: Color(0xff6b6b6b),
                                    fontSize: 13,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: '${bookingDetails.userName}, ',
                                      style: TextStyle(
                                        //fontWeight: FontWeight.bold,
                                        color: Color(0xff191919),
                                      ),
                                    ),
                                    TextSpan(text: 'for staying with STAYEGY'),
                                  ]),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Icon(
                                  Icons.location_city_rounded,
                                  size: 15,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: 'Selected Hotel ',
                                    style: TextStyle(
                                      color: Color(0xff6b6b6b),
                                      fontSize: 12,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: '${bookingDetails.hid} ${bookingDetails.hotelName}',
                                          style: TextStyle(
                                            color: Color(0xff191919),
                                          )),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  'images/dot.png',
                                  scale: 11,
                                  fit: BoxFit.fill,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Check In Date   ${DateFormat.yMMMMd().format(
                                        bookingDetails.dateRange['startDate'],
                                      )}',
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Check Out Date   ${DateFormat.yMMMMd().format(
                                        bookingDetails.dateRange['endDate'],
                                      )}',
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            LimitedBox(
                              // height: 150,
                              // width: double.maxFinite,
                              // alignment: Alignment.centerLeft,
                              maxHeight: 150,
                              maxWidth: double.maxFinite,
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: bookingDetails.selectedRooms.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    padding: EdgeInsets.only(bottom: 10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Image.asset(
                                              'images/one_box.png',
                                              scale: 10,
                                              fit: BoxFit.fill,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              '${bookingDetails.selectedRooms[index]}',
                                              style: TextStyle(fontSize: 14, height: 1),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          '${bookingDetails.roomsPrice[index]}',
                                          style: TextStyle(fontSize: 14, height: 1),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              color: Color(0xffefefef),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Total',
                                              style: TextStyle(
                                                fontSize: 12,
                                                height: 2,
                                                color: Color(0xff6b6b6b),
                                              ),
                                            ),
                                            Text(
                                              'Payment Method',
                                              style: TextStyle(
                                                fontSize: 12,
                                                height: 2,
                                                color: Color(0xff6b6b6b),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              '৳ ${bookingDetails.totalDiscountedPrice}',
                                              style: TextStyle(fontSize: 22, height: 1.5),
                                            ),
                                            Text(
                                              'Pay at Hotel',
                                              style: TextStyle(
                                                fontSize: 12,
                                                height: 0.5,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          'Payment Breakdown',
                                          style: TextStyle(
                                            fontSize: 12,
                                            height: 4,
                                            color: Color(0xFFA1A1A1),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Subtotal',
                                              style: GoogleFonts.roboto(
                                                fontSize: 12,
                                                height: 2,
                                                color: Color(0xff6b6b6b),
                                              ),
                                            ),
                                            Text(
                                              '${bookingDetails.totalPrice}',
                                              style: TextStyle(
                                                fontSize: 12,
                                                height: 2,
                                                color: Color(0xff6b6b6b),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Discount',
                                              style: GoogleFonts.roboto(
                                                fontSize: 12,
                                                height: 2,
                                                color: Color(0xff6b6b6b),
                                              ),
                                            ),
                                            Text(
                                              '${bookingDetails.totalDiscountedPrice - bookingDetails.totalPrice}',
                                              style: TextStyle(
                                                fontSize: 12,
                                                height: 2,
                                                color: Color(0xff6b6b6b),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Promo',
                                              style: TextStyle(
                                                fontSize: 12,
                                                height: 2,
                                                color: Color(0xff6b6b6b),
                                              ),
                                            ),
                                            Text(
                                              '-0',
                                              style: TextStyle(
                                                fontSize: 12,
                                                height: 2,
                                                color: Color(0xff6b6b6b),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Divider(
                                          color: Colors.black,
                                          thickness: 1,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Total',
                                              style: TextStyle(
                                                fontSize: 12,
                                                //height: 0.5,
                                                color: Color(0xff6b6b6b),
                                              ),
                                            ),
                                            Text(
                                              '৳${bookingDetails.totalDiscountedPrice}',
                                              style: TextStyle(
                                                fontSize: 12,
                                                //height: 0.5,
                                                color: Color(0xff6b6b6b),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.only(top: 10),
                                              child: Icon(
                                                Icons.local_offer_rounded,
                                                size: 14,
                                                color: Colors.red,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            GestureDetector(
                                              child: Text(
                                                'ADD A PROMO',
                                                style: TextStyle(fontSize: 12, height: 3, color: Colors.red),
                                              ),
                                              onTap: () {
                                                showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return StatefulBuilder(
                                                      builder: (context, setState) {
                                                        return AlertDialog(
                                                          buttonPadding: EdgeInsets.only(left: 0),
                                                          scrollable: true,
                                                          title: Center(
                                                            child: Text(
                                                              'Promo',
                                                              style: TextStyle(fontWeight: FontWeight.bold),
                                                            ),
                                                          ),
                                                          content: Form(
                                                            child: Container(
                                                              child: Column(
                                                                children: [
                                                                  TextField(
                                                                    decoration: InputDecoration(
                                                                      border: OutlineInputBorder(
                                                                        borderSide: BorderSide(color: Colors.pink),
                                                                      ),
                                                                      labelText: 'Promo Code',
                                                                      hintText: 'Enter Your Promo Code',
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 100,
                                                                  ),
                                                                  GestureDetector(
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
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                );
                                              },
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
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 1,
                left: 1,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: BottomButton(
                    text: 'CONFIRM',
                    disabled: false,
                    onTap: () {
                      BlocProvider.of<LoadingBloc>(context).add(
                        SendBookingRequestEvent(bookingDetails: bookingDetails),
                      );
                    },
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
