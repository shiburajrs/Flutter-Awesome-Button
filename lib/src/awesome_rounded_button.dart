import 'package:flutter/material.dart';

/// A customizable rounded button widget with elevation and text styling.
///
/// This button supports various customizations including text, background color, text color, border radius,
/// elevation (shadow effect), and padding. It also requires a callback for click events.
class AwesomeRoundedButton extends StatefulWidget {
  /// The text to display on the button.
  final String text;

  /// The background color of the button.
  final Color backgroundColor;

  /// The color of the text on the button.
  final Color textColor;

  /// The style to apply to the button's text.
  final TextStyle textStyle;

  /// The radius of the button's corners.
  final double borderRadius;

  /// The elevation of the button, which affects the shadow effect.
  final double elevation;

  /// The padding inside the button.
  final EdgeInsets padding;

  /// Callback function to handle click events.
  final VoidCallback onPressed;

  /// Creates an instance of [AwesomeRoundedButton].
  ///
  /// [text] is the text to display on the button (required).
  /// [backgroundColor] is the background color of the button (required).
  /// [textColor] is the color of the text (default is white).
  /// [textStyle] is the style to apply to the button's text (default style provided).
  /// [borderRadius] is the radius of the button's corners (default is 5.0).
  /// [elevation] is the elevation for shadow effect (default is 4.0).
  /// [padding] is the padding inside the button (default is vertical 12.0 and horizontal 16.0).
  /// [onPressed] is the callback function to handle click events (required).
  const AwesomeRoundedButton({
    super.key,
    required this.text,
    required this.backgroundColor,
    this.textColor = Colors.white,
    this.textStyle = const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 15),
    this.borderRadius = 5.0,
    this.elevation = 4.0,
    this.padding = const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
    required this.onPressed,
  });

  @override
  State<AwesomeRoundedButton> createState() => _AwesomeRoundedButtonState();
}

class _AwesomeRoundedButtonState extends State<AwesomeRoundedButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed, // Handle the click event
      child: Container(
        width: double.infinity, // Makes the button expand to fill its container
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: BorderRadius.circular(widget.borderRadius),
          boxShadow: [
            BoxShadow(
              color: widget.backgroundColor.withOpacity(0.5), // Shadow color matching background
              offset: Offset(1, widget.elevation), // Slightly offset the shadow
              blurRadius: widget.elevation,
            ),
          ],
        ),
        padding: widget.padding,
        child: Center(
          child: Text(
            widget.text,
            style: widget.textStyle,
          ),
        ),
      ),
    );
  }
}
