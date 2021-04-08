import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stayegy/bloc/Repository/Hotels/HotelDetails.dart';
import 'package:stayegy/bloc/Repository/Hotels/HotelRepositoy.dart';

import '../Models/card_model.dart';

class ShowSearchResult extends StatefulWidget {
  @override
  _ShowSearchResultState createState() => _ShowSearchResultState();
}

class _ShowSearchResultState extends State<ShowSearchResult> {
  HotelRepository _hotelRepository = HotelRepository();
  List<Hotel> _hotelList = [];

  @override
  void initState() {
    initList();
    super.initState();
  }

  void initList() async {
    setState(() async {
      _hotelList = await _hotelRepository.getSearchedList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Color(0xff191919),
            floating: true,
            pinned: false,
            automaticallyImplyLeading: false,
            leading: IconButton(
              padding: EdgeInsets.only(right: 15),
              iconSize: 10,
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                CupertinoIcons.back,
                // color: Color(0xff191919),
                color: Colors.white,
                size: 30,
              ),
            ),
            title: GestureDetector(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => ShowSearchResult())),
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
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(
                selected: true,
                title: CardModel(
                  hid: _hotelList[index].hid,
                  name: _hotelList[index].name,
                  address: _hotelList[index].address,
                  price: _hotelList[index].price,
                  images: _hotelList[index].images,
                ),
              ),
              childCount: _hotelList.length,
              addAutomaticKeepAlives: false,
              addRepaintBoundaries: false,
            ),
          ),
        ],
      ),
    );
  }
}
