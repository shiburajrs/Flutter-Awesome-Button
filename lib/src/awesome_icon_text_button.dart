import 'package:flutter/material.dart';

/// A button widget that combines text with an optional icon.
///
/// The button supports customization of text style, background color, border, and icon. It can display the icon either to the left or right of the text and supports both network and asset images for the icon.
class AwesomeIconTextButton extends StatelessWidget {
  /// The text displayed on the button.
  final String text;

  /// The style to apply to the text.
  final TextStyle? textStyle;

  /// The background color of the button.
  final Color? backgroundColor;

  /// The border radius of the button.
  final double borderRadius;

  /// The color of the button's border.
  final Color? borderColor;

  /// The width of the button's border.
  final double borderWidth;

  /// The URL or asset path of the icon image.
  final String? iconUrl;

  /// Flag to determine if the icon image is a network image.
  /// Defaults to `true`, indicating a network image.
  final bool isNetworkImage;

  /// Flag to determine the position of the icon relative to the text.
  /// If `true`, the icon is displayed to the right of the text; otherwise, it is displayed to the left.
  final bool iconOnRight;

  /// The padding inside the button.
  final EdgeInsets padding;

  /// The callback function that is called when the button is pressed.
  final VoidCallback? onPressed;

  /// Creates an instance of [AwesomeIconTextButton].
  ///
  /// [text] is the text to display on the button.
  /// [textStyle] is the style to apply to the text.
  /// [backgroundColor] is the background color of the button.
  /// [borderRadius] is the radius of the button's border.
  /// [borderColor] is the color of the button's border.
  /// [borderWidth] is the width of the button's border.
  /// [iconUrl] is the URL or asset path of the icon image.
  /// [isNetworkImage] indicates if the icon is a network image (default is `true`).
  /// [iconOnRight] determines if the icon should be displayed to the right of the text (default is `false`).
  /// [padding] is the padding inside the button.
  /// [onPressed] is the callback function for button press events.
  const AwesomeIconTextButton({
    super.key,
    required this.text,
    this.textStyle,
    this.backgroundColor,
    this.borderRadius = 0.0,
    this.borderColor,
    this.borderWidth = 1.0,
    this.iconUrl,
    this.isNetworkImage = true,
    this.iconOnRight = false,
    this.padding = const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
    required this.onPressed,
  });

  /// Builds the icon widget based on the [isNetworkImage] flag.
  ///
  /// Returns a network or asset image widget.
  Widget _buildIcon() {
    return isNetworkImage
        ? Image.network(
      iconUrl!,
      width: 30.0,
      height: 30.0,
      fit: BoxFit.cover,
    )
        : Image.asset(
      iconUrl!,
      width: 30.0,
      height: 30.0,
      fit: BoxFit.cover,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
          border: borderColor != null
              ? Border.all(color: borderColor!, width: borderWidth)
              : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: iconOnRight
              ? [
            Text(
              text,
              style: textStyle ?? const TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (iconUrl != null) ...[
              const SizedBox(width: 8.0),
              _buildIcon(),
            ],
          ]
              : [
            if (iconUrl != null) ...[
              _buildIcon(),
              const SizedBox(width: 8.0),
            ],
            Text(
              text,
              style: textStyle ?? const TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
