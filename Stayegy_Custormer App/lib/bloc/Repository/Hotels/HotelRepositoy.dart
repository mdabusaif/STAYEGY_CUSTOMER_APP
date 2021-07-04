import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:stayegy/bloc/Repository/Hotels/HotelDetails.dart';
import 'package:stayegy/constants/ConstantLists.dart';

class HotelRepository {
  FirebaseFirestore db = FirebaseFirestore.instance;

  Future getSearchedList({@required String cityName}) async {
    List<Hotel> searchedList = [];

    QuerySnapshot querySnapshot = await db.collection("hotels").where("tags", arrayContainsAny: [cityName]).get();
    print(querySnapshot.docs.length);
    for (int i = 0; i < querySnapshot.docs.length; i++) {
      searchedList.add(Hotel.fromMap(querySnapshot.docs[i].data()));
      print("${querySnapshot.docs.first.toString()} ++++ has been added to searched list!");
    }

    return searchedList;
  }

  Future<List<String>> getAllCity(String text) async {
    List filteredCityList = cityList;

    if (text.length == 2) return cityList;

    filteredCityList = cityList.where((city) => city.toLowerCase().contains(text.toLowerCase())).toList();

    return filteredCityList;
  }
}
