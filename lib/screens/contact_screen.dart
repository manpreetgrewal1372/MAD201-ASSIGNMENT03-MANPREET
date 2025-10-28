import 'package:flutter/material.dart';

/// ContactScreen displays the developer's contact information
/// including name, student ID, email, and role in the project.
/// Author: Manpreet Singh (A00198842)
/// Date: October 2025
class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  /// Builds the contact screen UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Us'), // AppBar title
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(16), // Add spacing around the content
          child: Text(
            'Developer: Manpreet Singh\n'
            'Student ID: A00198842\n'
            'Email: manpreetgrewal1372@gmail.com\n'
            'Flutter App Developer for MAD201 Assignment 3',
            textAlign: TextAlign.center, // Center the text
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
