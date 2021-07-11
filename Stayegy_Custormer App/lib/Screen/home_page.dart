import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stayegy/Models/card_model.dart';
import 'package:stayegy/Screen/SearchCity.dart';
import 'package:stayegy/Screen/SearchResult.dart';
import 'package:stayegy/Screen/appdrawer.dart';
import 'package:stayegy/Screen/contact.dart';
import 'package:stayegy/Screen/details_page.dart';
import 'package:stayegy/Screen/greetings.dart';
import 'package:stayegy/Screen/notification_page.dart';
import 'package:stayegy/Screen/t&c.dart';
import 'package:stayegy/bloc/LoadingBloc/loadingbloc_bloc.dart';
import 'package:stayegy/bloc/Repository/Hotels/HotelDetails.dart';
import 'package:stayegy/constants/ConstantLists.dart';

class home_page extends StatefulWidget {
  @override
  _home_pageState createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  Hotel demoHotelDetails = Hotel(name: "Redwan & Co.", hid: "STAYEGY 7584", address: "Lakhsmi Bazar,Dhaka", discountedPrice: {"Single | Non AC": 520}, price: {"Single | Non AC": 700});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => FlatButton(
            padding: EdgeInsets.all(18),
            child: Image.asset('images/App drawer.png'),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        title: Center(
          child: Image.asset(
            'images/stayegy gold logo.png',
            scale: 2.5,
            fit: BoxFit.fill,
          ),
        ),
        actions: <Widget>[
          FlatButton(
            padding: EdgeInsets.all(17),
            minWidth: 1,
            onPressed: () => Navigator.push(context, CupertinoPageRoute(builder: (context) => notification_page())),
            child: Image.asset('images/Notification bell.png'),
          ),
        ],
      ),
      drawerEdgeDragWidth: 0,
      drawer: appdrawer(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Color(0xff191919),
            floating: true,
            pinned: false,
            automaticallyImplyLeading: false,
            title: GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => SearchCity())),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: Colors.white,
                  ),
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(left: 15),
                  alignment: Alignment.centerLeft,
                  //color: Colors.white,
                  child: Text(
                    'Search for Hotel, City or Location',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  // height: MediaQuery.of(context).size.height,
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  // color: Colors.red,
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          addAutomaticKeepAlives: true,
                          itemCount: 9,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                BlocProvider.of<LoadingBloc>(context).add(SearchStartEvent(cityName: cityList[index].toString().toLowerCase()));
                                Navigator.push(context, MaterialPageRoute(builder: (_) => ShowSearchResult()));
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15, top: 10),
                                child: Column(
                                  children: [
                                    Container(
                                      child: CircleAvatar(
                                        radius: 30,
                                        backgroundImage: AssetImage('${cityImageList[index]}'),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(top: 5),
                                      alignment: Alignment.center,
                                      child: Text(
                                        '${cityList[index]}',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 200,
                  width: double.maxFinite,
                  color: Color(0xfff2f2f2),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                        child: Text(
                          'Offers',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff191919),
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          addAutomaticKeepAlives: true,
                          itemCount: 2,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Card(
                              elevation: 1,
                              margin: EdgeInsets.fromLTRB(20, 5, index == 1 ? 20 : 0, 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.asset("images/offer ${index + 1}.png"),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 250,
                  width: double.maxFinite,
                  color: Color(0xfff2f2f2),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                        child: Text(
                          'Stayegy Collections',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff191919),
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          addAutomaticKeepAlives: true,
                          itemCount: homePageHotels.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) => DetailsPage(
                                              hotelInt: homePageHotels[index],
                                            )));
                              },
                              child: Card(
                                elevation: 1,
                                margin: EdgeInsets.fromLTRB(index == 0 ? 20 : 10, 5, 0, 15),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Container(
                                    width: 180,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            color: Colors.grey,
                                            height: 120,
                                            child: ExtendedImage.network(
                                              homePageHotels[index].images[0],
                                              fit: BoxFit.cover,
                                              // mode: ExtendedImageMode.gesture,
                                              cache: true,
                                              // initGestureConfigHandler: (ExtendedImageState state) {
                                              //   return GestureConfig(
                                              //     //you must set inPageView true if you want to use ExtendedImageGesturePageView
                                              //     inPageView: true,
                                              //     initialScale: 1.0,
                                              //     maxScale: 5.0,
                                              //     animationMaxScale: 6.0,
                                              //     initialAlignment: InitialAlignment.center,
                                              //   );
                                              // },
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 10),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  homePageHotels[index].hid,
                                                  style: GoogleFonts.staatliches(
                                                    fontSize: 12,
                                                  ),
                                                ),
                                                Text(
                                                  homePageHotels[index].name,
                                                  maxLines: 1,
                                                  softWrap: false,
                                                  overflow: TextOverflow.fade,
                                                  style: GoogleFonts.staatliches(
                                                    fontSize: 16,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 4,
                                                ),
                                                Text(
                                                  '${(((homePageHotels[index].price["Single | Non AC"] - homePageHotels[index].discountedPrice["Single | Non AC"]) / homePageHotels[index].price["Single | Non AC"]) * 100).toInt()}% OFF',
                                                  style: GoogleFonts.staatliches(
                                                    fontSize: 20,
                                                    color: Colors.red,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      // child: Image.asset(
                                      //   "${offerImage1[0]}",
                                      //   fit: BoxFit.fill,
                                      // ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 220,
                  width: double.maxFinite,
                  color: Color(0xfff2f2f2),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                        child: Text(
                          'Concerning',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff191919),
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          addAutomaticKeepAlives: true,
                          itemCount: 3,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              child: Card(
                                elevation: 1,
                                margin: EdgeInsets.fromLTRB(index == 0 ? 20 : 12, 10, 0, 20),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Container(
                                      width: 200,
                                      child: Image.asset(
                                        '${concerning[index]}',
                                        fit: BoxFit.fill,
                                      )),
                                ),
                              ),
                              onTap: () {
                                if (index == 0) {
                                  Navigator.push(context, CupertinoPageRoute(builder: (context) => GreetingsPage()));
                                } else if (index == 1) {
                                  Navigator.push(context, CupertinoPageRoute(builder: (context) => TearmsAndConditionPage()));
                                } else if (index == 2) {
                                  Navigator.push(context, CupertinoPageRoute(builder: (context) => ContactPage()));
                                }
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // SliverList(
          //   delegate: SliverChildBuilderDelegate(
          //     (context, index) => ListTile(
          //       selected: true,
          //       title: CardModel(),
          //     ),
          //     childCount: 20,
          //   ),
          // ),
        ],
      ),
    );
  }
}
