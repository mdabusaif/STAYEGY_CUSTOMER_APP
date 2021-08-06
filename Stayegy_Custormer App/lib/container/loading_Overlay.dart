import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingOverlay {
  void buildOverlay(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () async => false,
            child: Container(
              color: Colors.black.withOpacity(0.8),
              child: SpinKitSquareCircle(
                color: Colors.white70,
                size: 20,
              ),
            ),
          );
        });
  }

  Widget buildWidget(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.8),
      child: SpinKitSquareCircle(
        color: Colors.white70,
        size: 20,
      ),
    );
  }
}
