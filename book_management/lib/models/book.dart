class Book {
  final int? id;
  final String? name;
  final String? author;
  final int? categoryId;
  final DateTime? publishedDate;
  final bool? status;

  Book(
      {this.id,
      this.name,
      this.author,
      this.categoryId,
      this.publishedDate,
      this.status});

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'],
      name: json['name'],
      author: json['author'],
      categoryId: json['categoryId'],
      publishedDate: json['publishedDate'],
      status: json['status'],
    );
  }
}
