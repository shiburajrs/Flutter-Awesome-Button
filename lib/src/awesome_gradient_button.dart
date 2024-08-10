import 'package:flutter/material.dart';

/// A button with a gradient background and optional loading indicator.
///
/// This button displays text with a gradient background. It can show a loading indicator while in the loading state and supports custom styling, gradient backgrounds, and border customization.
class AwesomeGradientButton extends StatelessWidget {
  /// The text displayed on the button.
  final String text;

  /// The style of the text displayed on the button.
  final TextStyle? textStyle;

  /// The gradient background of the button.
  final Gradient? gradient;

  /// The radius of the button's corners.
  final double borderRadius;

  /// The color of the button's border.
  final Color? borderColor;

  /// The width of the button's border.
  final double borderWidth;

  /// Indicates whether the button is in a loading state.
  final bool isLoading;

  /// The color of the loading indicator.
  final Color? loaderColor;

  /// The callback function that is called when the button is pressed.
  final VoidCallback? onPressed;

  /// Creates an instance of [AwesomeGradientButton].
  ///
  /// [text] is the text displayed on the button.
  /// [textStyle] is the style of the button's text.
  /// [gradient] is the gradient background of the button.
  /// [borderRadius] is the radius of the button's corners.
  /// [borderColor] is the color of the button's border.
  /// [borderWidth] is the width of the button's border.
  /// [isLoading] indicates whether the button is in a loading state.
  /// [loaderColor] is the color of the loading indicator.
  /// [onPressed] is the callback function for button press events.
  const AwesomeGradientButton({
    super.key,
    required this.text,
    this.textStyle,
    this.gradient,
    this.borderRadius = 0.0,
    this.borderColor,
    this.borderWidth = 1.0,
    this.isLoading = false,
    this.loaderColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onPressed, // Handle the click event only if not loading
      child: Container(
        decoration: BoxDecoration(
          gradient: gradient ?? const LinearGradient(
            colors: [Colors.blue, Colors.purple], // Default gradient if not provided
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(borderRadius), // Border radius
          border: borderColor != null
              ? Border.all(color: borderColor!, width: borderWidth) // Border color and width
              : null,
        ),
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0), // Padding inside the button
        child: Center(
          child: isLoading
              ? SizedBox(
            height: 20.0,
            width: 20.0,
            child: CircularProgressIndicator(
              color: loaderColor ?? Colors.white, // Loading indicator color
              strokeWidth: 2.0, // Width of the loading indicator stroke
            ),
          )
              : Text(
            text,
            style: textStyle ?? // Default text style if not provided
                const TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ),
    );
  }
}
