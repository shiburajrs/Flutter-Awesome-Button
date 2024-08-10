import 'package:flutter/material.dart';

/// A button widget that displays a loading indicator when pressed.
///
/// This button supports customization of the title, style, width, and loading widget. It also handles async operations and invokes callbacks on success or failure.
class AwesomeLoaderButton extends StatefulWidget {
  /// The text to display on the button.
  final String? title;

  /// The style to apply to the button's text.
  final TextStyle? style;

  /// The width of the button.
  final double? width;

  /// The async function to call when the button is pressed.
  /// Returns a dynamic response.
  final Future<dynamic> Function()? onPressed;

  /// Callback function to handle the response on success.
  /// The response from [onPressed] is passed as an argument.
  final void Function(dynamic response)? onSuccess;

  /// Callback function to handle failure.
  final VoidCallback? onFailure;

  /// Custom widget to display while the button is loading.
  final Widget? loadingWidget;

  /// Creates an instance of [AwesomeLoaderButton].
  ///
  /// [title] is the text to display on the button (required).
  /// [style] is the style to apply to the button's text.
  /// [width] is the width of the button (default is 200.0).
  /// [onPressed] is the async function to call when the button is pressed.
  /// [onSuccess] is the callback function to handle the response on success.
  /// [onFailure] is the callback function to handle failure.
  /// [loadingWidget] is a custom widget to display while loading.
  const AwesomeLoaderButton({
    super.key,
    required this.title,
    this.style,
    this.width = 200.0,
    this.onPressed,
    this.onSuccess,
    this.onFailure,
    this.loadingWidget,
  });

  @override
  _AwesomeLoaderButtonState createState() => _AwesomeLoaderButtonState();
}

class _AwesomeLoaderButtonState extends State<AwesomeLoaderButton> {
  bool _isLoading = false;

  /// Handles the button press event.
  /// Shows loading indicator, calls [onPressed], and invokes [onSuccess] or [onFailure] callbacks based on the result.
  void _handlePress() async {
    if (widget.onPressed == null) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final response = await widget.onPressed?.call();
      // Pass the response to the onSuccess callback
      if (widget.onSuccess != null) {
        widget.onSuccess!(response);
      }
    } catch (e) {
      // Call the onFailure callback if the API call failed
      widget.onFailure?.call();
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _isLoading ? null : _handlePress,
      child: Container(
        margin: EdgeInsets.only(left: widget.width != null ? 0 : 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.blue, // Default background color
        ),
        width: widget.width,
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0), // Default padding
        child: Center(
          child: _isLoading
              ? widget.loadingWidget ??
              const CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 2.0,
              )
              : Text(
            widget.title ?? "",
            style: widget.style ??
                const TextStyle(
                  color: Colors.white, // Default text color
                  fontSize: 16.0, // Default text size
                  fontWeight: FontWeight.bold, // Default text weight
                ),
          ),
        ),
      ),
    );
  }
}
