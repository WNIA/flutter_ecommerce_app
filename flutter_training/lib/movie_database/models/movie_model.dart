class Movie {
  int id;
  String name;
  String category;
  int releaseYear;
  double rating;
  String image;
  bool isFavorite;

  Movie({this.id,
    this.name,
    this.category,
    this.releaseYear,
    this.rating,
    this.image,
    this.isFavorite = false,
  });

  @override
  String toString() {
    return 'Movie{id: $id, name: $name, category: $category, releaseYear: $releaseYear, rating: $rating, image: $image, Favorite: $isFavorite}';
  }
}