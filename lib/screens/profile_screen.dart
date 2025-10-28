import 'package:flutter/material.dart';

/// ProfileScreen displays static user information including name, student ID,
/// email, and a brief description.
/// Author: Manpreet Singh (A00198842)
/// Date: October 2025
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  /// Builds the profile UI
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16), // Adds spacing around content
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // User avatar
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/manpreet.jpg'),
            ),
            const SizedBox(height: 12), // Spacer
            // User name
            const Text(
              'Manpreet Singh',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            // Student ID
            const Text('A00198842'),
            const SizedBox(height: 12), // Spacer
            // Email info
            const Text('Email: manpreetgrewal1372@gmail.com'),
            const SizedBox(height: 10), // Spacer
            // Brief description about user
            const Text(
              'Cybersecurity student who loves learning Flutter and app development!',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
