import 'package:book_management/blocs/book_form/book_form_bloc.dart'
    as _FormBloc;
import 'package:book_management/blocs/book_form/book_form_state.dart'
    as _FormState;
import 'package:book_management/blocs/book_list/book_list_bloc.dart';
import 'package:book_management/blocs/book_list/book_list_event.dart';
import 'package:book_management/blocs/book_list/book_list_state.dart';
import 'package:book_management/component/book_item.dart';
import 'package:book_management/component/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Icon cosIcon = Icon(Icons.search);
  Widget searchBar = Text("Book library");
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    BookListBloc bookBloc = BlocProvider.of<BookListBloc>(context);
    _FormBloc.BookFormBloc bookFormBloc =
        BlocProvider.of<_FormBloc.BookFormBloc>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffeeeeee),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {},
        ),
        appBar: AppBar(
          title: searchBar,
          actions: [
            IconButton(
              icon: this.cosIcon,
              onPressed: () {
                setState(() {
                  if (this.cosIcon.icon == Icons.search) {
                    this.cosIcon = Icon(Icons.cancel);
                    this.searchBar = TextField();
                  } else {
                    this.cosIcon = Icon(Icons.search);
                    this.searchBar = Text("Book library");
                  }
                });
              },
            ),
          ],
        ),
        body: Center(
          child: RefreshIndicator(
            key: _refreshIndicatorKey,
            onRefresh: () async {
              bookBloc.add(GetBooks(query: ""));
            },
            child:
                BlocListener<_FormBloc.BookFormBloc, _FormState.BookFormState>(
                    listener: (context, state) {
                      if (state.message!.isNotEmpty) {
                        _scaffoldKey.currentState!
                            .showSnackBar(snackBar(state.message.toString()));
                      }
                    },
                    child: BookListComponent()),
          ),
        ),
      ),
    );
  }
}

class BookListComponent extends StatefulWidget {
  BookListComponent({Key? key}) : super(key: key);

  @override
  _BookListComponentState createState() => _BookListComponentState();
}

class _BookListComponentState extends State<BookListComponent> {
  ScrollController controller = ScrollController();
  BookListBloc? bloc;

  void onScroll() {
    double maxScroll = controller.position.maxScrollExtent;
    double currentScroll = controller.position.pixels;

    if (currentScroll == maxScroll) bloc!.add(GetBooks(query: ""));
  }

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    bloc = BlocProvider.of(context);
    controller.addListener(onScroll);
    return Container(child: BlocBuilder<BookListBloc, BookListState>(
      builder: (context, state) {
        if (state is InitialBookListState)
          return Center(
            child: SizedBox(
              width: 30,
              height: 30,
              child: CircularProgressIndicator(),
            ),
          );
        else {
          Loaded bookLoaded = state as Loaded;
          return ListView.builder(
              padding: EdgeInsets.all(20),
              controller: controller,
              itemCount: (bookLoaded.hasReachedMax ?? false)
                  ? bookLoaded.books!.length
                  : bookLoaded.books!.length + 1,
              itemBuilder: (context, index) =>
                  (index < bookLoaded.books!.length)
                      ? BookItem(book: bookLoaded.books![index])
                      : Container(
                          child: Center(
                            child: SizedBox(
                              width: 30,
                              height: 30,
                              child: CircularProgressIndicator(),
                            ),
                          ),
                        ));
        }
      },
    ));
  }
}
