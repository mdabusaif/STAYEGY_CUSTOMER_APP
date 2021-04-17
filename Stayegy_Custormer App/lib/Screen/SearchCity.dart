import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stayegy/Screen/SearchResult.dart';
import 'package:stayegy/bloc/LoadingBloc/loadingbloc_bloc.dart';
import 'package:stayegy/bloc/Repository/Hotels/HotelRepositoy.dart';
import 'package:stayegy/constants/ConstantLists.dart';

class SearchCity extends StatefulWidget {
  @override
  _SearchCityState createState() => _SearchCityState();
}

class _SearchCityState extends State<SearchCity> {
  final HotelRepository _hotelRepository = HotelRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: SearchBar(
                  onSearch: _hotelRepository.getAllCity,
                  suggestions: cityList,
                  minimumChars: 1,
                  hintText: 'Enter City Name',
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  crossAxisCount: 1,
                  onItemFound: (String text, int index) {
                    return GestureDetector(
                      onTap: () async {
                        BlocProvider.of<LoadingblocBloc>(context)
                            .add(SearchStartEvent());
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => ShowSearchResult()));
                      },
                      child: Container(
                        //height: 50,
                        color: Colors.white70,
                        child: ListTile(
                          title: Text(text),
                          //isThreeLine: true,
                        ),
                      ),
                    );
                  },
                  emptyWidget: Container(
                    alignment: Alignment.center,
                    child: Text(
                      'No City Found!',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
