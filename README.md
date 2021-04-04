# pokeball
Simple custom painter pokeball widget.

## Usage
For more usages check the examples folder
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
              child: PokeBallWidget(
                color: Theme.of(context).textTheme.bodyText2?.color ?? Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
```
## Examples
<img src="https://user-images.githubusercontent.com/44870331/113492338-f3417e80-94d6-11eb-8889-f0e8a48b37c4.png" height="480"> <img src="https://user-images.githubusercontent.com/44870331/113492387-4b788080-94d7-11eb-8d5f-373603d44e24.png" height="480">
