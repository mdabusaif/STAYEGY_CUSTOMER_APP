import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stayegy/container/bottom_button.dart';

import 'home_page.dart';

class login_cprofile extends StatefulWidget {
  @override
  _login_cprofileState createState() => _login_cprofileState();
}

class _login_cprofileState extends State<login_cprofile> {
  String gender;
  DateTime dobDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          padding: EdgeInsets.only(right: 20),
          iconSize: 5,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            CupertinoIcons.back,
            color: Color(0xff191919),
            size: 30,
          ),
        ),
        title: Text(
          'Create Profile',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.only(left: 15, right: 15),
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 50.0,
                      child: Container(
                        height: 150,
                        padding: EdgeInsets.only(top: 13),
                        child: Image.asset('images/avater.png'),
                      ),
                    ),
                  ),
                  // Padding(
                  //   padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  //   child: Divider(),
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(10, 20, 0, 10),
                        labelText: 'Name',
                        hintText: 'ENTER YOUR FULL NAME',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0),
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        setState(() {});
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(10, 20, 0, 10),
                        labelText: 'Email',
                        hintText: 'ENTER YOUR EMAIL ADDRESS',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0),
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        setState(() {});
                      },
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'GENDER',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Radio(
                                  activeColor: Color(0xff191919),
                                  value: 'MALE',
                                  groupValue: gender,
                                  onChanged: (value) {
                                    setState(() {
                                      gender = value;
                                    });
                                  }),
                              Text('MALE'),
                              Radio(
                                  activeColor: Color(0xff191919),
                                  value: 'FEMALE',
                                  groupValue: gender,
                                  onChanged: (value) {
                                    setState(() {
                                      gender = value;
                                    });
                                  }),
                              Text('FEMALE'),
                              Radio(
                                  activeColor: Color(0xff191919),
                                  value: 'OTHER',
                                  groupValue: gender,
                                  onChanged: (value) {
                                    setState(() {
                                      gender = value;
                                    });
                                  }),
                              Text('OTHER'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0.0,
              right: 1,
              left: 1,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      'By signing up you are accepting all our Terms and Privacy policy',
                      style: TextStyle(
                        fontSize: 12.0,
                      ),
                    ),
                    BottomButton(
                        text: 'SUBMIT',
                        disabled: true,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => home_page()));
                        })
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
