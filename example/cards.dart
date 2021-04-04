import 'package:flutter/material.dart';
import 'package:pokeball_widget/pokeball.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) => Scaffold(
          body: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PokeCard(color: Colors.red),
                  PokeCard(color: Colors.green),
                  PokeCard(color: Colors.blue),
                  PokeCard(color: Colors.yellow),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PokeCard extends StatelessWidget {
  final Color color;
  const PokeCard({Key key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints:
          BoxConstraints(minHeight: MediaQuery.of(context).size.height / 7),
      child: Card(
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 8,
        child: LayoutBuilder(
          builder: (context, constraints) => Stack(
            children: [
              Positioned(
                right: constraints.maxWidth * -0.04,
                top: constraints.minHeight * 0.1,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 6,
                  width: MediaQuery.of(context).size.height / 6,
                  child: PokeBallWidget(
                    color: color,
                  ),
                ),
              ),
              Row(
                children: [Text('')],
              )
            ],
          ),
        ),
      ),
    );
  }
}
