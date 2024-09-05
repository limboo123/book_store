class BookList {
  String image;
  String bookName;
  String author;
  String publishDate;
  int price;
  int quantity;
  double rating;
  bool Bookmarked; // Add this property
  BookList({
    required this.image,
    required this.bookName,
    required this.author,
    required this.publishDate,
    required this.price,
    required this.quantity,
    required this.rating,
    this.Bookmarked = false, // Initialize as false
  });
}
