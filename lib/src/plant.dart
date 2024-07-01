class Plant {
  final String id;
  final String genus;
  final String image;
  final String rating;
  final String inch;
  final double price;

  const Plant({
    required this.id,
    required this.genus,
    required this.image,
    required this.rating,
    required this.inch,
    required this.price,
  });

  @override
  String toString() {
    return 'Plant(id: $id, genus: $genus, image: $image, rating: $rating, inch: $inch, price: $price)';
  }

  @override
  bool operator ==(covariant Plant other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.genus == genus &&
        other.image == image &&
        other.rating == rating &&
        other.price == price &&
        other.inch == inch;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        genus.hashCode ^
        image.hashCode ^
        price.hashCode ^
        rating.hashCode ^
        inch.hashCode;
  }
}
