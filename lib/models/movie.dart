/// Movie model class
/// Stores movie information and favorite status
/// Author: Manpreet Singh (A00198842)
/// Date: October 2025
class Movie {
  /// Title of the movie
  final String title;

  /// Genre of the movie (e.g., Action, Romance)
  final String genre;

  /// Release year of the movie
  /// Should always be positive and <= current year
  final int year;

  /// Short description of the movie
  final String description;

  /// Path to the movie poster image asset
  final String imagePath;

  /// Tracks if the movie is marked as favorite
  bool isFavorite;

  /// Constructor for Movie class
  /// Validates that year is positive; otherwise throws error
  Movie({
    required this.title,
    required this.genre,
    required int year,
    required this.description,
    required this.imagePath,
    this.isFavorite = false,
  }) : year = (year > 0 && year <= DateTime.now().year) 
            ? year 
            : throw ArgumentError('Year must be positive and not in the future');

  /// Toggle favorite status
  void toggleFavorite() {
    isFavorite = !isFavorite;
  }
}
