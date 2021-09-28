import 'package:book_management/blocs/book_list/book_list_event.dart';
import 'package:book_management/blocs/book_list/book_list_state.dart';
import 'package:book_management/models/book.dart';
import 'package:book_management/resouces/book_api_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookListBloc extends Bloc<BookListEvent, BookListState> {
  BookListBloc(BookListState initialState) : super(initialState);

  @override
  Stream<BookListState> mapEventToState(BookListEvent event) async* {
    List<Book> books;

    // yield Loading();

    if (event is GetBooks) {
      try {
        if (state is InitialBookListState) {
          books = await BookApiProvider().getBookList(0, 5);
          yield Loaded(books: books, hasReachedMax: false);
        } else {
          Loaded bookLoaded = state as Loaded;
          books =
              await BookApiProvider().getBookList(bookLoaded.books!.length, 5);

          yield (books.isEmpty)
              ? bookLoaded.copyWith(hasReachedMax: true)
              : Loaded(books: bookLoaded.books! + books, hasReachedMax: false);
        }
      } catch (e) {
        yield Error(errorMessage: e.toString());
      }
    } else if (event is DeleteBook) {
      try {
        //code
      } catch (e) {
        yield Error(errorMessage: e.toString());
      }
    }
  }
}
