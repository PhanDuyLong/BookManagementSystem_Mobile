import 'package:book_management/models/book.dart';
import 'package:flutter/cupertino.dart';

class BookItem extends StatelessWidget {
  final Book book;
  const BookItem({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 100),
      child: Text(book.id.toString() + book.name.toString()),
    );
  }
}