import 'package:flutter/material.dart';
import 'detail_screen.dart';
import '../main.dart'; // Import global movie list

/// HomeScreen displays a list of all movies with their poster, title, genre, year,
/// and favorite status. Tapping a movie navigates to its detail page.
/// Author: Manpreet Singh (A00198842)
/// Date: October 2025
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /// Builds the HomeScreen UI with a scrollable list of movie cards
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movieList.length, // Total number of movies
      itemBuilder: (context, index) {
        final movie = movieList[index]; // Current movie item

        return Card(
          margin: const EdgeInsets.all(10), // Space around each card
          child: ListTile(
            // Movie poster image
            leading: Image.asset(
              movie.imagePath,
              width: 60,
              height: 80,
              fit: BoxFit.cover,
            ),
            // Movie title
            title: Text(movie.title),
            // Genre and release year
            subtitle: Text('${movie.genre} • ${movie.year}'),
            // Favorite icon button
            trailing: IconButton(
              icon: Icon(
                movie.isFavorite ? Icons.favorite : Icons.favorite_border,
                color: movie.isFavorite ? Colors.red : null,
              ),
              onPressed: () {
                setState(() {
                  movie.isFavorite = !movie.isFavorite; // Toggle favorite status
                });
              },
            ),
            // Navigate to detail screen on tap
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => MovieDetailScreen(movie: movie),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
