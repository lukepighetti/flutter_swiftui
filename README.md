# swiftui

A research implementation of SwiftUI view transformations on Flutter Widgets using Dart extensions.

```dart
class Example extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("padded").padded(8),
        Text("offsetX").offsetX(100),
        Text("offsetY").offsetY(-200),
        Text("offsetDegrees").offsetDegrees(180, 100),
        Text("foo").border(Border.all()),
        Text("More padded").padded(40),
      ],
    );
  }
}
```

## Contributing

Since this API is intended for research, I'm totally happy with people submitting breaking changes and altering the direction of this project. My starting point was to try to implement the most-common View transformations you see in SwiftUI, but I make no claims that the architecture I've chosen makes the most sense. I'd much rather someone break the API with something novel than try to fight with implementing the SwiftUI api extactly.

In other words, SwiftUI is merely an inspiration, and not a specification.