import 'package:flutter/material.dart';

/// A customizable button with a border and text.
///
/// This button displays a border with customizable color and width, and text with customizable style and color.
class AwesomeBorderedButton extends StatefulWidget {
  /// The text displayed on the button.
  final String text;

  /// The color of the border surrounding the button.
  final Color borderColor;

  /// The color of the text displayed on the button.
  final Color textColor;

  /// The style of the text displayed on the button.
  final TextStyle textStyle;

  /// The border radius of the button's corners.
  final double borderRadius;

  /// The padding inside the button.
  final EdgeInsets padding;

  /// The callback function that is called when the button is pressed.
  final VoidCallback onPressed;

  /// Creates an instance of [AwesomeBorderedButton].
  ///
  /// [text] is the text displayed on the button.
  /// [borderColor] is the color of the button's border.
  /// [textColor] is the color of the text.
  /// [textStyle] is the style of the text.
  /// [borderRadius] is the radius of the button's corners.
  /// [padding] is the padding inside the button.
  /// [onPressed] is the callback function for button press events.
  const AwesomeBorderedButton({
    super.key,
    required this.text,
    required this.borderColor,
    this.textColor = Colors.white,
    this.textStyle = const TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15),
    this.borderRadius = 5.0,
    this.padding = const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
    required this.onPressed,
  });

  @override
  State<AwesomeBorderedButton> createState() => _AwesomeBorderedButtonState();
}

class _AwesomeBorderedButtonState extends State<AwesomeBorderedButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed, // Handle the click event
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: widget.borderColor, width: 2), // Border color and width
          borderRadius: BorderRadius.circular(widget.borderRadius), // Border radius
        ),
        padding: widget.padding, // Padding inside the button
        child: Center(
          child: Text(
            widget.text, // Displayed text
            style: widget.textStyle, // Text style
          ),
        ),
      ),
    );
  }
}
