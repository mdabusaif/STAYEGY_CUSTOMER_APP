import 'package:flutter/material.dart';

class GradientCreate extends StatelessWidget {
  GradientCreate({@required this.child});

  final Gradient _gold_gradient =
      LinearGradient(colors: [Color(0xffb88746), Color(0xfffdf5a6)]);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return _gold_gradient.createShader(Offset.zero & bounds.size);
      },

      ///create the child color white to apply gradient
      child: child,
    );
  }
}
