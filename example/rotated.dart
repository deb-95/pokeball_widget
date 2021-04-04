import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pokeball_widget/pokeball_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) => Scaffold(
          body: Center(
            // Squared container for the pokeball
            child: SizedBox(
              height: MediaQuery.of(context).size.width / 2,
              width: MediaQuery.of(context).size.width / 2,
              child: Transform.rotate(
                angle: _degToRad(15),
                child: PokeBallWidget(
                  color: Theme.of(context).textTheme.bodyText2?.color ??
                      Colors.black,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

double _degToRad(double degrees) {
  return degrees * pi / 180;
}
