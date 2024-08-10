import 'package:flutter/material.dart';

/// A button with a dotted border and optional loading indicator.
///
/// This button displays text with an optional dotted border. It can show a loading indicator while in the loading state and supports custom styling and border colors.
class AwesomeDottedButton extends StatelessWidget {
  /// The text displayed on the button.
  final String text;

  /// The style of the text displayed on the button.
  final TextStyle? textStyle;

  /// The color of the button's border.
  final Color? borderColor;

  /// The radius of the button's corners.
  final double borderRadius;

  /// Indicates whether the button is in a loading state.
  final bool isLoading;

  /// The color of the loading indicator.
  final Color? loaderColor;

  /// The callback function that is called when the button is pressed.
  final VoidCallback? onPressed;

  /// Creates an instance of [AwesomeDottedButton].
  ///
  /// [text] is the text displayed on the button.
  /// [textStyle] is the style of the button's text.
  /// [borderRadius] is the radius of the button's corners.
  /// [borderColor] is the color of the button's border.
  /// [isLoading] indicates whether the button is in a loading state.
  /// [loaderColor] is the color of the loading indicator.
  /// [onPressed] is the callback function for button press events.
  const AwesomeDottedButton({
    super.key,
    required this.text,
    this.textStyle,
    this.borderRadius = 8.0,
    this.borderColor = Colors.black,
    this.isLoading = false,
    this.loaderColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onPressed, // Handle the click event only if not loading
      child: CustomPaint(
        painter: DottedBorderPainter(
          color: borderColor!,
          strokeWidth: 2.0,
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0), // Padding inside the button
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius), // Border radius
          ),
          child: Center(
            child: isLoading
                ? SizedBox(
              height: 20.0,
              width: 20.0,
              child: CircularProgressIndicator(
                color: loaderColor ?? Colors.black, // Loading indicator color
                strokeWidth: 2.0, // Width of the loading indicator stroke
              ),
            )
                : Text(
              text,
              style: textStyle ??
                  const TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}

/// A custom painter that draws a dotted border.
///
/// This painter draws a dotted border around the button using specified color, stroke width, and gap between dashes.
class DottedBorderPainter extends CustomPainter {
  /// The color of the border.
  final Color color;

  /// The width of the border strokes.
  final double strokeWidth;

  /// The gap between the dashes.
  final double gap;

  /// Creates an instance of [DottedBorderPainter].
  ///
  /// [color] is the color of the border.
  /// [strokeWidth] is the width of the border strokes.
  /// [gap] is the gap between the dashes.
  DottedBorderPainter({
    required this.color,
    this.strokeWidth = 1.0,
    this.gap = 3.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final double dashWidth = strokeWidth;
    double startX = 0;

    // Draw top border
    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, 0),
        Offset(startX + dashWidth, 0),
        paint,
      );
      startX += dashWidth + gap;
    }

    startX = 0;

    // Draw left border
    while (startX < size.height) {
      canvas.drawLine(
        Offset(0, startX),
        Offset(0, startX + dashWidth),
        paint,
      );
      startX += dashWidth + gap;
    }

    startX = 0;

    // Draw bottom border
    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, size.height),
        Offset(startX + dashWidth, size.height),
        paint,
      );
      startX += dashWidth + gap;
    }

    startX = 0;

    // Draw right border
    while (startX < size.height) {
      canvas.drawLine(
        Offset(size.width, startX),
        Offset(size.width, startX + dashWidth),
        paint,
      );
      startX += dashWidth + gap;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
