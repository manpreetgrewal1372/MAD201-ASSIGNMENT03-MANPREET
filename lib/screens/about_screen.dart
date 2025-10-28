import 'package:flutter/material.dart';

/// AboutScreen displays information about the Movie Explorer App,
/// its purpose, and the assignment it was built for.
/// Author: Manpreet Singh (A00198842)
/// Date: October 2025
class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  /// Builds the AboutScreen UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About App'), // AppBar title
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(16), // Add spacing around content
          child: Text(
            'Movie Explorer App lets users browse and favorite movies.\n'
            'Built with Flutter for Assignment 3 of MAD201.',
            textAlign: TextAlign.center, // Center text
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
