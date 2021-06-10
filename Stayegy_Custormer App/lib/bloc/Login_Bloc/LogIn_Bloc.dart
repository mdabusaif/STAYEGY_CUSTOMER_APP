import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stayegy/bloc/Login_Bloc/LogIn_Events.dart';
import 'package:stayegy/bloc/Login_Bloc/LogIn_State.dart';
import 'package:stayegy/constants/ConstantLists.dart';

import '../Repository/User/UserRepository.dart';
import '../Repository/User/User_Details.dart';

class LogInBloc extends Bloc<LogInEvent, LogInState> {
  final UserRepository _userRepository;
  UserDetails _userDetails;
  StreamSubscription subscription;
  UserCredential _userCredential;

  String verID = "";

  LogInBloc({UserRepository userRepository, UserDetails userDetails})
      : assert(userRepository != null),
        _userRepository = userRepository,
        _userDetails = userDetails,
        super(InitialLogInState());

  @override
  Stream<LogInState> mapEventToState(LogInEvent event) async* {
    if (event is SendOtpEvent) {
      yield LoadingState();

      subscription = sendOtp(event.phoNo).listen((event) {
        add(event);
      });
    } else if (event is OtpSentEvent) {
      yield OtpSentState();
    } else if (event is LogInCompleteEvent) {
      yield LogInCompleteState(event.firebaseUser);
    } else if (event is LogInExceptionEvent) {
      yield ExceptionState(message: event.message);
    } else if (event is VerifyOtpEvent) {
      yield LoadingState();
      try {
        _userCredential = await _userRepository.verifyAndLogin(verID, event.otp);
        final bool isRegistered = await _userRepository.checkForRegistration(_userDetails, _userCredential.user.uid);
        if (_userCredential.user != null && !isRegistered) {
          yield RegistrationNeededState();
        } else if (_userCredential.user != null && isRegistered) {
          _userDetails = await _userRepository.loadUserDetails(_userCredential.user.uid);
          userDetailsGlobal = _userDetails;
          yield LogInCompleteState(_userCredential.user);
        } else {
          yield OtpExceptionState(message: "Invalid otp!");
        }
      } catch (e) {
        yield OtpExceptionState(message: 'Invalid otp!');
        print(e);
      }
    } else if (event is UploadDetailsEvent) {
      yield LoadingState();
      await _userRepository.uploadUserDetails(user: _userDetails, name: event.name, email: event.email, phoneNumber: _userCredential.user.phoneNumber, gender: event.gender, image: event.image);
      _userDetails = await _userRepository.loadUserDetails(_userCredential.user.uid);
      userDetailsGlobal = _userDetails;
      yield RegistrationCompleteState(_userCredential.user);
    } else if (event is UpdateUserDetailsEvent) {
      yield LoadingState();
      bool complete = false;
      switch (event.operationType) {
        case 'name':
          await _userRepository.updateUserInfo(operationType: 'name', uid: userDetailsGlobal.uid, name: event.name);
          complete = true;
          break;
        case 'email':
          await _userRepository.updateUserInfo(operationType: 'email', uid: userDetailsGlobal.uid, email: event.email);
          complete = true;
          break;
        case 'photo':
          await _userRepository.updateUserInfo(operationType: 'photo', uid: userDetailsGlobal.uid, imageFile: event.image, currentImageURL: userDetailsGlobal.picURL);
          complete = true;
          break;
      }

      if (complete) {
        userDetailsGlobal = await _userRepository.loadUserDetails(userDetailsGlobal.uid);
        yield UpdateUserDetailsCompleteState();
      } else {
        yield ExceptionState(message: 'Update Failed!');
      }
    }
  }

  @override
  void onEvent(LogInEvent event) {
    super.onEvent(event);
    print(event);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    print(stackTrace);
  }

  @override
  Future<void> close() {
    print('Bloc Closed');
    return super.close();
  }

  Stream<LogInEvent> sendOtp(String phoNo) async* {
    StreamController<LogInEvent> eventStream = StreamController();
    final PhoneVerificationCompleted = (AuthCredential authCredential) {
      _userRepository.getUser();
      _userRepository.getUser().catchError((onError) {
        print(onError);
      }).then((user) {
        eventStream.add(LogInCompleteEvent(user));
        eventStream.close();
      });
    };
    final PhoneVerificationFailed = (FirebaseAuthException firebaseAuthException) {
      print(firebaseAuthException.message);
      eventStream.add(LogInExceptionEvent(onError.toString()));
      eventStream.close();
    };

    final PhoneCodeSent = (String verId, [int forceResent]) {
      this.verID = verId;
      eventStream.add(OtpSentEvent());
    };

    final PhoneCodeAutoRetrievalTimeout = (String verId) {
      this.verID = verId;
      eventStream.close();
    };

    await _userRepository.sendOTP(phoNo, Duration(seconds: 1), PhoneVerificationCompleted, PhoneVerificationFailed, PhoneCodeSent, PhoneCodeAutoRetrievalTimeout);
    yield* eventStream.stream;
  }
}
