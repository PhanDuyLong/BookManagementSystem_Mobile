import 'package:book_management/models/book.dart';
import 'package:meta/meta.dart';

@immutable
abstract class BookListEvent {
  final Book? book;
  final String? query;

  BookListEvent({this.book, this.query, user});
}

class GetBooks extends BookListEvent {
  GetBooks({required String query}) : super(query: query);
}

class DeleteBook extends BookListEvent {
  DeleteBook({required Book book}) : super(book: book);
}
