class BookEntity {
    final String? bookId;

  final String? image;
  final String title;
  final String? authorName;
  final num? prise;
  final num? rating;

  BookEntity(
      {required this.image,
      required this.title,
      required this.bookId,
      required this.authorName,
      required this.prise,
      required this.rating});
}
