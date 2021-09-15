import 'package:book_management/models/book.dart';
import 'package:book_management/resouces/book_api_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookEvent {}

abstract class BookState {}

class BookUninitialized extends BookState {}

class BookLoaded extends BookState {
  List<Book>? books;
  bool? hasReachedMax;

  BookLoaded({this.books, this.hasReachedMax});

  BookLoaded copyWith({List<Book>? books, bool? hasReachedMax}) {
    return BookLoaded(
        books: books ?? this.books,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax);
  }
}

class BookBloc extends Bloc<BookEvent, BookState> {
  BookBloc(BookState initialState) : super(initialState);

  @override
  Stream<BookState> mapEventToState(BookEvent event) async* {
    List<Book> books;

    if (state is BookUninitialized) {
      books = await BookApiProvider().getBookList(0, 5);
      yield BookLoaded(books: books, hasReachedMax: false);
    } else {
      BookLoaded bookLoaded = state as BookLoaded;
      books = await BookApiProvider().getBookList(bookLoaded.books!.length, 5);

      yield (books.isEmpty) 
      ? bookLoaded.copyWith(hasReachedMax: true)
      : BookLoaded(books: bookLoaded.books! + books,  hasReachedMax: false);
    }
  }
}
