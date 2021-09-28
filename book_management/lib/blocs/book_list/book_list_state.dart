import 'package:book_management/models/book.dart';
import 'package:meta/meta.dart';

@immutable
abstract class BookListState {
  final List<Book>? books;
  final String? message;

  BookListState({this.books, this.message});
}
  
class InitialBookListState extends BookListState {}

class Loading extends BookListState {
  final List<Book>? books;
  final bool? hasReachedMax;

  Loading({this.books, this.hasReachedMax}) : super(books: books);

  Loading copyWith({List<Book>? books, bool? hasReachedMax}) {
    return Loading(
        books: books ?? this.books,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax);
  }
}

class Error extends BookListState {
  Error({required String errorMessage}) : super(message: errorMessage);
}

class Loaded extends BookListState {
  final List<Book>? books;
  final bool? hasReachedMax;

  Loaded({this.books, this.hasReachedMax}) : super(books: books);

  Loaded copyWith({List<Book>? books, bool? hasReachedMax}) {
    return Loaded(
        books: books ?? this.books,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax);
  }
}