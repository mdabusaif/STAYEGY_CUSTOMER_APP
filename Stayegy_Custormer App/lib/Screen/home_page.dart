import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stayegy/Screen/SearchCity.dart';
import 'package:stayegy/Screen/SearchResult.dart';
import 'package:stayegy/Screen/appdrawer.dart';
import 'package:stayegy/Screen/notification_page.dart';
import 'package:stayegy/bloc/LoadingBloc/loadingbloc_bloc.dart';
import 'package:stayegy/constants/ConstantLists.dart';

class home_page extends StatefulWidget {
  @override
  _home_pageState createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
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
                  height: 90,
                  width: MediaQuery.of(context).size.width,
                  //color: Colors.red,
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: 10,
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
                                        radius: 25,
                                        backgroundImage: AssetImage('images/Notification bell.png'),
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
                Container(
                  height: MediaQuery.of(context).size.height,
                  //color: Colors.green,
                  alignment: Alignment.center,
                  child: Text(
                    'Welcome To Stayegy!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 50,
                    ),
                  ),
                )
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
