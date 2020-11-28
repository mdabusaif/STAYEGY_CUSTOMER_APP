import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:stayegy/container/gradient_creation.dart';

class LoadingOverlay {
  Widget build(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return Container(
            color: Colors.black.withOpacity(0.8),
            child: GradientCreate(
              child: SpinKitSquareCircle(
                color: Colors.white,
                size: 50,
              ),
            ),
          );
        });
  }
}
