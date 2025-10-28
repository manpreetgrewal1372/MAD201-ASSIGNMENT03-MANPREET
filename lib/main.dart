// MAD201 - Assignment 3
// Movie Explorer App
// Author: Manpreet Singh (A00198842)
// Description: Flutter app to explore movies with Home, Favorites, Profile screens and About/Contact pages
// Date: October 2025

import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/favorites_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/about_screen.dart';
import 'screens/contact_screen.dart';
import 'models/movie.dart';

/// Global movie list shared across all screens
List<Movie> movieList = [
  Movie(
      title: 'Inception',
      genre: 'Sci-Fi',
      year: 2010,
      description: 'A thief steals secrets through dream-sharing technology.',
      imagePath: 'assets/inception.jpg'),
  Movie(
      title: 'Interstellar',
      genre: 'Adventure',
      year: 2014,
      description: 'A group travels through a wormhole to save humanity.',
      imagePath: 'assets/interstellar.jpg'),
  Movie(
      title: 'The Dark Knight',
      genre: 'Action',
      year: 2008,
      description: 'Batman faces the Joker in Gotham City.',
      imagePath: 'assets/dark_knight.png'),
  Movie(
      title: 'Avatar',
      genre: 'Fantasy',
      year: 2009,
      description: 'A Marine joins a new world and learns its ways.',
      imagePath: 'assets/avatar.jpg'),
  Movie(
      title: 'Titanic',
      genre: 'Romance',
      year: 1997,
      description: 'A young couple falls in love aboard the doomed ship.',
      imagePath: 'assets/titanic.jpg'),
  Movie(
      title: 'Joker',
      genre: 'Thriller',
      year: 2019,
      description: 'A failed comedian descends into madness in Gotham.',
      imagePath: 'assets/joker.jpg'),
];

void main() {
  runApp(const MovieExplorerApp());
}

/// Main App with BottomNavigationBar and Drawer
class MovieExplorerApp extends StatefulWidget {
  const MovieExplorerApp({super.key});

  @override
  State<MovieExplorerApp> createState() => _MovieExplorerAppState();
}

class _MovieExplorerAppState extends State<MovieExplorerApp> {
  int _currentIndex = 0; // Tracks selected bottom tab
  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    // Initialize list of pages for BottomNavigationBar
    _pages = [
      const HomeScreen(),
      const FavoritesScreen(),
      const ProfileScreen(),
    ];
  }

  /// Updates bottom tab index
  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  /// Builds main Scaffold with AppBar, Drawer, Body, BottomNavigationBar
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Explorer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: Scaffold(
        appBar: AppBar(title: const Text('Movie Explorer')),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(color: Colors.deepPurple),
                child: Text('Menu', style: TextStyle(color: Colors.white, fontSize: 22)),
              ),
              // Home tab
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Home'),
                onTap: () {
                  setState(() {
                    _currentIndex = 0; // Home tab
                  });
                  Navigator.pop(context); // Close drawer
                },
              ),
              // Favorites tab
              ListTile(
                leading: const Icon(Icons.favorite),
                title: const Text('Favorites'),
                onTap: () {
                  setState(() {
                    _currentIndex = 1; // Favorites tab
                  });
                  Navigator.pop(context); // Close drawer
                },
              ),
              // Profile tab
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Profile'),
                onTap: () {
                  setState(() {
                    _currentIndex = 2; // Profile tab
                  });
                  Navigator.pop(context); // Close drawer
                },
              ),
              // About screen
              ListTile(
                leading: const Icon(Icons.info_outline),
                title: const Text('About'),
                onTap: () {
                  Navigator.pop(context); // Close drawer first
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const AboutScreen()),
                  );
                },
              ),
              // Contact screen
              ListTile(
                leading: const Icon(Icons.contact_page),
                title: const Text('Contact'),
                onTap: () {
                  Navigator.pop(context); // Close drawer first
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const ContactScreen()),
                  );
                },
              ),
            ],
          ),
        ),
        // Main content changes according to selected tab
        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onTabTapped,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}

/// Validation function example: prevents negative movie year
bool isValidYear(int year) {
  // Returns true if year is positive and <= current year
  return year > 0 && year <= DateTime.now().year;
}
