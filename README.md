# pokeball
Simple custom painter pokeball widget.

## Usage
For the full usage check the examples folder
```dart
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
              child: CustomPaint(
                painter: PokeBallPainter(
                  color: Theme.of(context).textTheme.bodyText2.color,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
```
