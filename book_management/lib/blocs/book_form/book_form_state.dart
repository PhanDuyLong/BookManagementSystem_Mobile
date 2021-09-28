import 'package:book_management/models/book.dart';
import 'package:meta/meta.dart';

@immutable
abstract class BookFormState {
  final Book? book;
  final String? message;

  BookFormState({this.book, this.message});
}
  
class InitialBookFormState extends BookFormState {}

class Loading extends BookFormState {}

class Error extends BookFormState {
  Error({required String errorMessage}) : super(message: errorMessage);
}

class Loaded extends BookFormState {
  Loaded({required Book book}) : super(book: book);
}

class Success extends BookFormState {
  Success({required String successMessage}) : super(message: successMessage);
}
