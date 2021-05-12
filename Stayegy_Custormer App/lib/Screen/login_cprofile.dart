import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stayegy/bloc/Authentication_Bloc/Authentication_Bloc.dart';
import 'package:stayegy/bloc/Authentication_Bloc/Authentication_Events.dart';
import 'package:stayegy/bloc/FormBloc/Form_Bloc.dart';
import 'package:stayegy/bloc/FormBloc/Form_Events.dart';
import 'package:stayegy/bloc/FormBloc/Form_States.dart';
import 'package:stayegy/bloc/Login_Bloc/LogIn_Bloc.dart';
import 'package:stayegy/bloc/Login_Bloc/LogIn_Events.dart';
import 'package:stayegy/bloc/Login_Bloc/LogIn_State.dart';
import 'package:stayegy/container/SnackBar.dart';
import 'package:stayegy/container/bottom_button.dart';
import 'package:stayegy/container/loading_Overlay.dart';

class login_cprofile extends StatefulWidget {
  @override
  _login_cprofileState createState() => _login_cprofileState();
}

class _login_cprofileState extends State<login_cprofile> {
  String _name = "";
  String _email = "";
  String _gender = "MALE";
  File _image;

  @override
  Widget build(BuildContext context) {
    final FormBloc formBloc = BlocProvider.of<FormBloc>(context);
    final LogInBloc logInBloc = BlocProvider.of<LogInBloc>(context);
    final AuthenticationBloc _authenticationBloc =
        BlocProvider.of<AuthenticationBloc>(context);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
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
        body: MultiBlocListener(
          listeners: [
            BlocListener<FormBloc, FormStates>(listener: (context, state) {
              if (state is RegFormCanBeSubmittedState) {
                logInBloc.add(UploadDetailsEvent(
                    name: _name,
                    email: _email,
                    gender: _gender,
                    image: _image));
              } else if (state is ImagePickedFailedState) {
                SnackBarBuilder().buildSnackBar(context,
                    message: 'Failed to load image.', color: Colors.red);
              } else if (state is ImagePickedState) {
                _image = File(state.pickedFile.path);
              }
            }),
            BlocListener<LogInBloc, LogInState>(listener: (context, state) {
              if (state is RegistrationCompleteState) {
                _authenticationBloc.add(LoggedIn(token: state.getUser().uid));
                Navigator.popUntil(context, (route) => route.isFirst);
              } else if (state is LoadingState) {
                LoadingOverlay().buildOverlay(context);
              }
            })
          ],
          child: Container(
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Stack(
              children: <Widget>[
                SingleChildScrollView(
                  child: BlocBuilder<FormBloc, FormStates>(
                      builder: (context, state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        SizedBox(
                          height: 10.0,
                        ),
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              print('Upload Button pressed!');
                              formBloc.add(GetImageEvent());
                            },
                            child: Container(
                              ///Todo: Take photo from gallery
                              child: Stack(
                                children: <Widget>[
                                  CircleAvatar(
                                    backgroundColor: Colors.black,
                                    radius: 50.0,
                                    child: state is ImagePickedState
                                        ? ClipOval(
                                            child: Image.file(
                                              File(state.pickedFile.path),
                                              fit: BoxFit.cover,
                                              width: 100,
                                            ),
                                          )
                                        : Container(
                                            padding: EdgeInsets.only(top: 15),
                                            child: Image.asset(
                                              'images/avater.png',
                                            ),
                                          ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 3,
                                    child: Icon(
                                      Icons.add_a_photo,
                                      color: Colors.black,
                                      size: 20,
                                    ),
                                  ),
                                ],
                              ),
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
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[a-zA-Z .]')),
                            ],
                            onChanged: (value) => _name = value,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(10, 20, 0, 10),
                              labelText: 'Name',
                              hintText: 'ENTER YOUR FULL NAME',
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(0),
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                              border: OutlineInputBorder(),
                              errorText: state is NameFieldEmptyState
                                  ? 'This field can not be empty!'
                                  : null,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 15),
                          child: TextField(
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (value) => _email = value,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(10, 20, 0, 10),
                              labelText: 'Email',
                              hintText: 'ENTER YOUR EMAIL ADDRESS',
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(0),
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                              border: OutlineInputBorder(),
                              errorText: state is EmailFieldEmptyState
                                  ? 'This field can not be empty!'
                                  : state is EmailFieldNotValidState
                                      ? 'Email format is not valid!'
                                      : null,
                            ),
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
                                        groupValue: _gender,
                                        onChanged: (value) {
                                          setState(() {
                                            _gender = value;
                                          });
                                        }),
                                    Text('MALE'),
                                    Radio(
                                        activeColor: Color(0xff191919),
                                        value: 'FEMALE',
                                        groupValue: _gender,
                                        onChanged: (value) {
                                          setState(() {
                                            _gender = value;
                                          });
                                        }),
                                    Text('FEMALE'),
                                    Radio(
                                        activeColor: Color(0xff191919),
                                        value: 'OTHER',
                                        groupValue: _gender,
                                        onChanged: (value) {
                                          setState(() {
                                            _gender = value;
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
                    );
                  }),
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
                            disabled: false,
                            onTap: () {
                              print("Pressed");
                              print(_name);
                              print(_email);
                              formBloc.add(NameAndEmailValidationCheckEvent(
                                  name: _name, email: _email));
                            })
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
