import 'package:flutter/material.dart';

/// A customizable animated button with text and an icon that animates to a rounded shape and rotates the icon when clicked.
class AwesomeAnimatedButton extends StatefulWidget {
  /// The text displayed on the button.
  final String text;

  /// The background color of the button.
  final Color backgroundColor;

  /// The color of the text and icon.
  final Color textColor;

  /// The style of the text displayed on the button.
  final TextStyle textStyle;

  /// The border radius of the button's corners.
  final double borderRadius;

  /// The elevation of the button for shadow effects.
  final double elevation;

  /// The padding inside the button.
  final EdgeInsets padding;

  /// The callback function that is called when the button is pressed.
  final VoidCallback onPressed;

  /// Creates an instance of [AwesomeAnimatedButton].
  const AwesomeAnimatedButton({
    super.key,
    required this.text,
    required this.backgroundColor,
    this.textColor = Colors.white,
    this.textStyle = const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 15),
    this.borderRadius = 5.0,
    this.elevation = 4.0,
    this.padding = const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
    required this.onPressed,
  });

  @override
  State<AwesomeAnimatedButton> createState() => _AwesomeAnimatedButtonState();
}

class _AwesomeAnimatedButtonState extends State<AwesomeAnimatedButton> with SingleTickerProviderStateMixin {
  bool _isClicked = false;
  late AnimationController _animationController;
  late Animation<double> _rotationAnimation;
  late Animation<double> _borderRadiusAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize the AnimationController
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    // Initialize the rotation animation
    _rotationAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    // Initialize the border radius animation
    _borderRadiusAnimation = Tween<double>(begin: widget.borderRadius, end: 25.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  /// Handles button press events, triggers animations and calls the provided onPressed callback.
  void _handlePress() {
    setState(() {
      _isClicked = !_isClicked;
    });

    // Start or reverse the animation based on the button's state
    if (_isClicked) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }

    // Execute the provided onPressed callback
    widget.onPressed();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handlePress,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: _isClicked ? 50.0 : 200.0,
        height: 50.0,
        constraints: BoxConstraints(
          maxWidth: _isClicked ? 50.0 : 200.0,
        ),
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: BorderRadius.circular(_borderRadiusAnimation.value),
          boxShadow: [
            BoxShadow(
              color: widget.backgroundColor.withOpacity(0.5),
              offset: Offset(1, widget.elevation),
              blurRadius: widget.elevation,
            ),
          ],
        ),
        padding: widget.padding,
        child: AnimatedCrossFade(
          duration: const Duration(milliseconds: 300),
          firstChild: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.close, color: widget.textColor, size: 24.0),
                const SizedBox(width: 8.0),
                Expanded(
                  child: Text(
                    widget.text,
                    style: widget.textStyle,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          secondChild: Center(
            child: AnimatedBuilder(
              animation: _rotationAnimation,
              builder: (context, child) {
                return Transform.rotate(
                  angle: _rotationAnimation.value * 2 * 3.14159, // Rotate 360 degrees
                  child: Icon(
                    Icons.close,
                    color: widget.textColor,
                    size: 24.0,
                  ),
                );
              },
            ),
          ),
          crossFadeState: _isClicked
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
        ),
      ),
    );
  }
}
