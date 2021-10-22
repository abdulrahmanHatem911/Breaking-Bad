import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AnimatedCircle extends StatelessWidget {
  const AnimatedCircle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SpinKitSpinningLines(
      duration: Duration(seconds: 4),
      color: Colors.blueAccent,
      size: 150,
      itemCount: 5,
      lineWidth: 9,
    );
  }
}
