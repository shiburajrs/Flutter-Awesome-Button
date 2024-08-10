import 'package:flutter/material.dart';

/// A circular button with an icon that can be loaded from a network or local asset.
///
/// This button displays an image as its icon, with customizable background color, size, padding, and click handling. It supports loading images from the network or from local assets.
class AwesomeIconButton extends StatefulWidget {
  /// The URL of the image to display. Can be a network URL or an asset path.
  final String imageUrl;

  /// The background color of the button.
  final Color backgroundColor;

  /// The padding inside the button.
  final EdgeInsets padding;

  /// The diameter of the button.
  final double size;

  /// The callback function that is called when the button is pressed.
  final VoidCallback onPressed;

  /// Flag to determine if the image is a network image.
  /// Defaults to `true`, indicating a network image.
  final bool isNetworkImage;

  /// Creates an instance of [AwesomeIconButton].
  ///
  /// [imageUrl] is the URL or asset path of the image to display.
  /// [backgroundColor] is the color of the button's background.
  /// [padding] is the padding inside the button.
  /// [size] is the diameter of the button.
  /// [onPressed] is the callback function for button press events.
  /// [isNetworkImage] indicates if the image is a network image (default is `true`).
  const AwesomeIconButton({
    super.key,
    required this.imageUrl,
    required this.backgroundColor,
    this.padding = const EdgeInsets.all(8.0),
    this.size = 50.0,
    required this.onPressed,
    this.isNetworkImage = true,
  });

  @override
  State<AwesomeIconButton> createState() => _AwesomeIconButtonState();
}

class _AwesomeIconButtonState extends State<AwesomeIconButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed, // Handle the click event
      child: Container(
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          shape: BoxShape.circle, // Makes the button circular
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(2, 2),
              blurRadius: 5.0, // Shadow blur radius
            ),
          ],
        ),
        padding: widget.padding,
        child: ClipOval(
          child: widget.isNetworkImage
              ? Image.network(
            widget.imageUrl,
            fit: BoxFit.cover,
            width: widget.size,
            height: widget.size,
          )
              : Image.asset(
            widget.imageUrl,
            fit: BoxFit.cover,
            width: widget.size,
            height: widget.size,
          ),
        ),
      ),
    );
  }
}
