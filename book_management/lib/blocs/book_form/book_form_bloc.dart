import 'package:book_management/blocs/book_form/book_form_evet.dart';
import 'package:book_management/blocs/book_form/book_form_state.dart';
import 'package:book_management/models/book.dart';
import 'package:book_management/resouces/book_api_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookFormBloc extends Bloc<BookFormEvent, BookFormState> {
  final _book = Book();

  BookFormBloc(BookFormState initialState) : super(initialState);

  @override
  Stream<BookFormState> mapEventToState(BookFormEvent event) async* {
    yield Loading();
    if (event is GetBook) {
      try {
        yield Loaded(
            book: event.book?.id == null
                ? Book()
                : await BookApiProvider().getBook(event.book?.id));
      } catch (e) {
        yield Error(errorMessage: e.toString());
      }
    } else if (event is BackEvent) {
      yield InitialBookFormState();
    } else if (event is CreateBook) {
      try {
        // await
      } catch (e) {
        yield Error(errorMessage: e.toString());
      }
    } else if (event is UpdateBook) {
      try {
        //code
      } catch (e) {
        yield Error(errorMessage: e.toString());
      }
    }
  }
}
