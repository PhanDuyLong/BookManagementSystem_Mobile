import 'package:book_management/blocs/book_bloc.dart';
import 'package:book_management/component/book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xffeeeeee),
          appBar: AppBar(
            title: Text("Book library"),
          ),
          body: BlocProvider<BookBloc>(
            create: (context) =>
                BookBloc(BookUninitialized())..add(BookEvent()),
            child: BookListComponent(),
          )),
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
  BookBloc? bloc;

  void onScroll() {
    double maxScroll = controller.position.maxScrollExtent;
    double currentScroll = controller.position.pixels;

    if (currentScroll == maxScroll) bloc!.add(BookEvent());
  }

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    bloc = BlocProvider.of(context);
    controller.addListener(onScroll);
    return Container(child: BlocBuilder<BookBloc, BookState>(
      builder: (context, state) {
        if (state is BookUninitialized)
          return Center(
            child: SizedBox(
              width: 30,
              height: 30,
              child: CircularProgressIndicator(),
            ),
          );
        else {
          BookLoaded bookLoaded = state as BookLoaded;
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
