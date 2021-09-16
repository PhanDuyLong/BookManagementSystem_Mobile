class Book {
  final int? id;
  final String? name;
  final String? author;
  final int? categoryId;
  final String? category;
  final DateTime? publishedDate;
  final bool? status;

  Book(
      {this.id,
      this.name,
      this.author,
      this.categoryId,
      this.category,
      this.publishedDate,
      this.status});

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'],
      name: json['name'],
      author: json['author'],
      categoryId: json['categoryId'],
      category: json['category'],
      publishedDate: json['publishedDate'],
      status: json['status'],
    );
  }
}
