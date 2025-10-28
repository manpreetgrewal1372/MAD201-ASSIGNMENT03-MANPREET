import 'package:flutter/material.dart';
import '../models/movie.dart';

/// MovieDetailScreen displays full information about a selected movie,
/// including poster, title, genre, year, description, and favorite status.
/// Users can add or remove the movie from favorites.
/// Author: Manpreet Singh (A00198842)
/// Date: October 2025
class MovieDetailScreen extends StatefulWidget {
  /// The movie object to display
  final Movie movie;

  const MovieDetailScreen({super.key, required this.movie});

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  /// Builds the detail screen UI for a movie
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.movie.title), // Movie title in AppBar
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16), // Spacing around content
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Movie poster
            Image.asset(widget.movie.imagePath),
            const SizedBox(height: 10),
            // Movie title
            Text(
              widget.movie.title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            // Genre and year
            Text('${widget.movie.genre} • ${widget.movie.year}'),
            const SizedBox(height: 12),
            // Movie description
            Text(
              widget.movie.description,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            // Favorite toggle button
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  widget.movie.isFavorite = !widget.movie.isFavorite; // Toggle favorite
                });
              },
              icon: Icon(
                widget.movie.isFavorite ? Icons.favorite : Icons.favorite_border,
              ),
              label: Text(
                widget.movie.isFavorite ? 'Remove Favorite' : 'Add to Favorites',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
