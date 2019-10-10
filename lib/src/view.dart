import 'dart:math';

import 'package:flutter/widgets.dart';

/// Implementation of SwiftUI View transformations.
///
/// https://developer.apple.com/documentation/swiftui/view

extension SettingTheSizeOfAView on Widget {
  /// Positions the view within an invisible frame with the specified size.
  Widget frame({
    double width,
    double height,
    Alignment alignment: Alignment.center,
  }) =>
      Container(
        width: width,
        height: height,
        alignment: alignment,
        child: this,
      );

  /// Positions the view within an invisible frame with the specified width and height.
  Widget frameConstrained({
    double minWidth,
    double idealWidth,
    double maxWidth,
    double minHeight,
    double idealHeight,
    double maxHeight,
    Alignment alignment,
  }) =>
      Container(
        width: idealWidth,
        height: idealHeight,
        alignment: alignment,
        constraints: BoxConstraints(
          minWidth: minWidth,
          maxWidth: maxWidth,
          minHeight: minHeight,
          maxHeight: maxHeight,
        ),
        child: this,
      );

  /// func fixedSize() -> View
  /// Fixes the view at its ideal size.

  /// func fixedSize(horizontal: Bool, vertical: Bool) -> View
  /// Fixes the view at its ideal size in the specified dimensions.

}

extension SpecifyingTheRelativeSizeOfAView on Widget {
  /// func layoutPriority(Double) -> View
  /// Sets the priority by which a parent layout should apportion space to the child.
}

extension SettingThePositionOfAView on Widget {
  /// Fixes the center of the view at the specified point in its parent’s coordinate space.
  Widget position(Offset offset) => LayoutBuilder(
        builder: (context, constraints) {
          assert(constraints.hasBoundedHeight);
          assert(constraints.hasBoundedWidth);

          return Container(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            alignment: Alignment.center,
            child: Transform.translate(
              offset: offset,
              child: this,
            ),
          );
        },
      );

  /// Fixes the center of the view at the specified coordinates in its parent’s coordinate space.
  Widget positionOnly({double x, double y}) => position(Offset(x, y));

  /// Offsets the view by the horizontal and vertical distances in the given size.
  Widget offset(Offset offset) =>
      Transform.translate(offset: offset, child: this);

  /// Offsets the view by the specified horizontal and vertical distances.
  // Widget offsetOnly({double x = 0.0, double y = 0.0}) =>
  //     Transform.translate(offset: Offset(x, y), child: this);

  Widget offsetX(double x) =>
      Transform.translate(offset: Offset(x, 0.0), child: this);

  Widget offsetY(double y) =>
      Transform.translate(offset: Offset(0.0, y), child: this);

  Widget offsetDegrees(double degrees, double distance) => Transform.translate(
      offset: Offset.fromDirection(2 * pi * (degrees / 360), distance),
      child: this);

  /// func edgesIgnoringSafeArea(Edge.Set) -> View
  /// Extends the view out of the safe area on the specified edges.
}

extension AligningViews on Widget {
  /// func alignmentGuide(HorizontalAlignment, computeValue: (ViewDimensions) -> CGFloat) -> View
  /// Sets the view’s horizontal alignment.

  /// func alignmentGuide(VerticalAlignment, computeValue: (ViewDimensions) -> CGFloat) -> View
  /// Sets the view’s vertical alignment.
}

extension AdjustingThePaddingOfAView on Widget {
  /// Pads the view along all edge insets by the specified amount.
  Widget padded(double amount) =>
      Padding(padding: EdgeInsets.all(amount), child: this);

  /// Pads the view using the specified edge insets.
  Widget paddedInsets(EdgeInsets insets) =>
      Padding(padding: insets, child: this);

  /// func padding(Edge.Set, CGFloat?) -> View
  /// Pads the view using the specified edge insets.
}

extension SettingTheForegroundOrBackgroundOfAView on Widget {
  /// func overlay<Overlay>(Overlay, alignment: Alignment) -> View
  /// Layers a secondary view in front of the view.
  Widget overlay(
    Widget overlay, [
    Alignment alignment = Alignment.center,
  ]) =>
      Stack(alignment: alignment, children: <Widget>[this, overlay]);

  /// func foregroundColor(Color?) -> View
  /// Sets the color that the view uses for foreground elements.

  /// func background<Background>(Background, alignment: Alignment) -> View
  Widget background(
    Widget background, [
    Alignment alignment = Alignment.center,
  ]) =>
      Stack(alignment: alignment, children: <Widget>[background, this]);

  /// func zIndex(Double) -> View
  /// Controls the display order of overlapping views.
}

extension SettingTheBorderOfAView on Widget {
  /// Adds a border to the view with the specified style and width.
  Widget border(Border style) =>
      Container(decoration: BoxDecoration(border: style), child: this);
}
