import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stayegy/bloc/FormBloc/Form_Bloc.dart';
import 'package:stayegy/bloc/FormBloc/Form_Events.dart';
import 'package:stayegy/bloc/FormBloc/Form_States.dart';
import 'package:stayegy/bloc/Login_Bloc/LogIn_Bloc.dart';
import 'package:stayegy/bloc/Login_Bloc/LogIn_Events.dart';

import 'login_otp.dart';

class login_page extends StatefulWidget {
  @override
  _login_pageState createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  String _counntryCode, _phoneNumber;

  @override
  Widget build(BuildContext context) {
    final FormBloc formBloc = BlocProvider.of<FormBloc>(context);
    final LogInBloc logInBloc = BlocProvider.of<LogInBloc>(context);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            //Container for logo
            Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.fromLTRB(100, 200, 100, 0),
              child: Hero(
                tag: 'logo',
                child: Image.asset('images/LOGO Plain.png'),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 2),
                height: 350,
                padding: EdgeInsets.fromLTRB(30, 150, 30, 150),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 1.5,
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: CountryCodePicker(
                            onChanged: (code) {
                              _counntryCode = code.dialCode;
                              print(_counntryCode);
                            },
                            onInit: (code) {
                              _counntryCode = code.dialCode;
                              print(_counntryCode);
                            },
                            initialSelection: 'BD',
                            //padding: EdgeInsets.only(left: 5, right: 5),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(left: 10),
                          child: TextField(
                            keyboardType: TextInputType.phone,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            onChanged: (value) {
                              formBloc.add(
                                  PhoneNumberCheckEvent(phoneNumber: value));
                              _phoneNumber = value;
                            },

                            /// TODO: Decorate the textfield perfectly
                            decoration: InputDecoration(
                              hintText: 'Enter Number',
                              disabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: BlocBuilder<FormBloc, FormStates>(
                          builder: (context, state) {
                            return Container(
                              //color: Colors.black87,
                              color: state is PhoneNumberNotCheckedState
                                  ? Colors.black12
                                  : state is PhoneNumberCheckedState
                                      ? Colors.black87
                                      : Colors.black12,
                              margin: EdgeInsets.only(left: 25),
                              child: FlatButton(
                                onPressed: () {
                                  print('Pressed!');
                                  if (state is PhoneNumberCheckedState) {
                                    logInBloc.add(
                                      SendOtpEvent(
                                          phoNo: _counntryCode + _phoneNumber),
                                    );
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => login_otp()));
                                  }
                                },
                                child: Image(
                                  image: AssetImage(state
                                          is PhoneNumberNotCheckedState
                                      ? 'images/arrow button default.png'
                                      : state is PhoneNumberCheckedState
                                          ? 'images/arrow button submit.png'
                                          : 'images/arrow button default.png'),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
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
