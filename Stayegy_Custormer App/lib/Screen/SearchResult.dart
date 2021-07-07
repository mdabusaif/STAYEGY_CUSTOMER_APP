import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:stayegy/Screen/SearchCity.dart';
import 'package:stayegy/bloc/LoadingBloc/loadingbloc_bloc.dart';
import 'package:stayegy/bloc/Repository/Hotels/HotelDetails.dart';
import 'package:stayegy/bloc/Repository/Hotels/HotelRepositoy.dart';
import 'package:stayegy/container/loading_Overlay.dart';

import '../Models/card_model.dart';

class ShowSearchResult extends StatefulWidget {
  @override
  _ShowSearchResultState createState() => _ShowSearchResultState();
}

class _ShowSearchResultState extends State<ShowSearchResult> {
  List<Hotel> _hotelList = [];

  @override
  Widget build(BuildContext context) {
    final LoadingBloc loadingblocBloc = BlocProvider.of<LoadingBloc>(context);

    return Scaffold(
      body: BlocListener<LoadingBloc, LoadingBlocState>(
        listener: (context, state) {
          if (state is SearchCompleteState) {
            _hotelList = state.loadedHotels;
          }
        },
        child: BlocBuilder<LoadingBloc, LoadingBlocState>(
          builder: (context, state) {
            if (state is SearchCompleteState) {
              return CustomScrollView(
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
                        Navigator.popUntil(context, (route) => route.isFirst);
                      },
                      icon: Icon(
                        CupertinoIcons.back,
                        // color: Color(0xff191919),
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    title: GestureDetector(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => SearchCity()), (route) => route.isFirst);
                      },
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
                          hotel: _hotelList[index],
                        ),
                      ),
                      childCount: _hotelList.length,
                      addAutomaticKeepAlives: true,
                      addRepaintBoundaries: false,
                    ),
                  ),
                ],
              );
            } else {
              return LoadingOverlay().buildWidget(context);
            }
          },
        ),
      ),
    );
  }
}
