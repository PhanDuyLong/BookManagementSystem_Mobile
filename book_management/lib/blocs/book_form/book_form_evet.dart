import 'package:book_management/models/book.dart';
import 'package:meta/meta.dart';

@immutable
abstract class BookFormEvent {
  final Book? book;

  BookFormEvent({this.book});
}

class BackEvent extends BookFormEvent {}

class GetBook extends BookFormEvent {
  GetBook({required Book book}) : super(book: book);
}

class CreateBook extends BookFormEvent {
  CreateBook({required Book book}) : super(book: book);
}

class UpdateBook extends BookFormEvent {
  UpdateBook({required Book book}) : super(book: book);
}
