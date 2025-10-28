import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../main.dart'; // Global movie list
import 'detail_screen.dart';

/// FavoritesScreen displays movies marked as favorite by the user.
/// Users can remove movies from favorites or tap to view details.
/// Author: Manpreet Singh (A00198842)
/// Date: October 2025
class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  /// Builds the FavoritesScreen UI
  @override
  Widget build(BuildContext context) {
    // Filter only movies marked as favorite
    List<Movie> favorites = movieList.where((movie) => movie.isFavorite).toList();

    // Show message if no favorites
    if (favorites.isEmpty) {
      return const Center(
        child: Text(
          'No favorites yet.',
          style: TextStyle(fontSize: 18),
        ),
      );
    }

    // Display list of favorite movies
    return ListView.builder(
      itemCount: favorites.length,
      itemBuilder: (context, index) {
        final movie = favorites[index];

        return Card(
          margin: const EdgeInsets.all(10), // Space around each card
          child: ListTile(
            // Movie poster
            leading: Image.asset(
              movie.imagePath,
              width: 60,
              height: 80,
              fit: BoxFit.cover,
            ),
            // Movie title
            title: Text(movie.title),
            // Genre and year
            subtitle: Text('${movie.genre} • ${movie.year}'),
            // Remove from favorites button
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                setState(() {
                  movie.isFavorite = false; // Unmark as favorite
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
