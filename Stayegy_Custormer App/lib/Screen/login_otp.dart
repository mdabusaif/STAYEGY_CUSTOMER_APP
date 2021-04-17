import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stayegy/Screen/login_cprofile.dart';
import 'package:stayegy/bloc/Authentication_Bloc/Authentication_Bloc.dart';
import 'package:stayegy/bloc/Authentication_Bloc/Authentication_Events.dart';
import 'package:stayegy/bloc/Login_Bloc/LogIn_Bloc.dart';
import 'package:stayegy/bloc/Login_Bloc/LogIn_Events.dart';
import 'package:stayegy/bloc/Login_Bloc/LogIn_State.dart';
import 'package:stayegy/container/SnackBar.dart';
import 'package:stayegy/container/bottom_button.dart';
import 'package:stayegy/container/loading_Overlay.dart';

class login_otp extends StatefulWidget {
  @override
  _login_otpState createState() => _login_otpState();
}

class _login_otpState extends State<login_otp> {
  String _otpCode;

  @override
  Widget build(BuildContext context) {
    final LogInBloc _loginBloc = BlocProvider.of<LogInBloc>(context);
    final AuthenticationBloc _authenticationBloc =
        BlocProvider.of<AuthenticationBloc>(context);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
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
        ),
        body: BlocListener<LogInBloc, LogInState>(
          listener: (context, state) {
            if (state is ExceptionState || state is OtpExceptionState) {
              String _message;
              if (state is ExceptionState) {
                _message = state.message;
              } else if (state is OtpExceptionState) {
                _message = state.message;
              }
              Navigator.pop(context);
              SnackBarBuilder()
                  .buildSnackBar(context, message: _message, color: Colors.red);
            } else if (state is LogInCompleteState) {
              _authenticationBloc.add(LoggedIn(token: state.getUser().uid));
              Navigator.popUntil(context, (route) => route.isFirst);
            } else if (state is RegistrationNeededState) {
              Navigator.push(context,
                  CupertinoPageRoute(builder: (_) => login_cprofile()));
            } else if (state is LoadingState) {
              LoadingOverlay().buildOverlay(context);
            }
          },
          child: Container(
            child: Stack(
              children: <Widget>[
                Container(
                  alignment: Alignment.topCenter,
                  padding: const EdgeInsets.fromLTRB(100, 70, 100, 0),
                  child: Hero(
                    tag: 'logo',
                    child: Image.asset('images/LOGO Plain.png'),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        onChanged: (value) => _otpCode = value,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: 'ENTER OTP',
                        ),
                      ),
                      BottomButton(
                        text: 'SUBMIT',
                        disabled: false,
                        onTap: () {
                          print(_otpCode);
                          _loginBloc.add(VerifyOtpEvent(otp: _otpCode));
                          FocusScope.of(context).unfocus();
                        },
                      ),
                      Text(
                        'Didn\'t receive the code? Resend the code in 00:59',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
