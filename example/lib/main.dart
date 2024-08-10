import 'package:flutter/material.dart';
import 'package:flutter_awesome_buttons/flutter_awesome_buttons.dart';

void main() {
  runApp(const MyApp());
}

/// The root widget of the application.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

/// The home page widget of the application.
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Awesome Rounded Button
              AwesomeRoundedButton(
                text: "Submit",
                backgroundColor: Colors.blue,
                onPressed: () {
                },
              ),
              const SizedBox(height: 15),

              // Awesome Bordered Button
              AwesomeBorderedButton(
                text: "Submit",
                borderColor: Colors.blue,
                onPressed: () {
                },
              ),
              const SizedBox(height: 15),

              // Awesome Icon Button
              AwesomeIconButton(
                onPressed: () {
                },
                imageUrl: 'https://mfg.fhstp.ac.at/cms/wp-content/uploads/2022/05/flutter-dash.png',
                backgroundColor: Colors.blue,
                isNetworkImage: true,
              ),
              const SizedBox(height: 15),

              // Row of Awesome Icon Text Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AwesomeIconTextButton(
                    text: "Submit",
                    borderRadius: 8,
                    iconUrl: 'https://mfg.fhstp.ac.at/cms/wp-content/uploads/2022/05/flutter-dash.png',
                    isNetworkImage: true,
                    iconOnRight: false,
                    backgroundColor: Colors.blue,
                    onPressed: () {
                    },
                  ),
                  AwesomeIconTextButton(
                    text: "Submit",
                    borderRadius: 8,
                    iconUrl: 'https://mfg.fhstp.ac.at/cms/wp-content/uploads/2022/05/flutter-dash.png',
                    isNetworkImage: true,
                    iconOnRight: true,
                    backgroundColor: Colors.green,
                    onPressed: () {
                    },
                  ),
                ],
              ),
              const SizedBox(height: 15),

              // Awesome Loader Button
              AwesomeLoaderButton(
                title: "Submit",
                onPressed: () async {
                  // Your async function here
                },
                onSuccess: (response) {
                  // Handle success
                },
                onFailure: () {
                  // Handle failure
                },
                loadingWidget: const CircularProgressIndicator(), // Custom loading widget
              ),
              const SizedBox(height: 15),

              // Awesome Dotted Button
              AwesomeDottedButton(
                text: 'Click Me',
                borderColor: Colors.blue, // Dotted border color
                borderRadius: 12.0, // Border radius
                isLoading: false, // Set to true to show the loader
                onPressed: () {
                },
              ),
              const SizedBox(height: 15),

              // Awesome Gradient Button
              AwesomeGradientButton(
                text: 'Click Me',
                gradient: const LinearGradient(
                  colors: [Colors.blue, Colors.purple],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: 25.0,
                borderWidth: 2.0,
                isLoading: false,
                onPressed: () {
                },
                loaderColor: Colors.white,
              ),
              const SizedBox(height: 15),

              // Awesome Animated Button
              AwesomeAnimatedButton(
                text: 'Click Me',
                backgroundColor: Colors.blue,
                borderRadius: 8.0,
                elevation: 5.0,
                onPressed: () {
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
