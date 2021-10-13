// import 'package:book_management/blocs/book_form/book_form_bloc.dart';
// import 'package:book_management/blocs/book_form/book_form_state.dart';
// import 'package:book_management/blocs/book_list/book_list_bloc.dart';
// import 'package:book_management/blocs/book_list/book_list_event.dart';
// import 'package:book_management/blocs/book_list/book_list_state.dart';
import 'package:book_management/resouces/login_provider.dart';
// import 'package:book_management/ui/home_page.dart';
import 'package:book_management/ui/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     title: 'Flutter Demo',
    //     theme: ThemeData(
    //       primarySwatch: Colors.blue,
    //     ),
    //     home: MultiBlocProvider(
    //       providers: [
    //         BlocProvider<BookListBloc>(
    //           create: (context) => BookListBloc(InitialBookListState())
    //             ..add(GetBooks(query: "")),
    //         ),
    //         BlocProvider<BookFormBloc>(
    //           create: (context) => BookFormBloc(InitialBookFormState()),
    //         ),
    //       ],
    //       child: HomePage(),
    //     ));
         return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: RepositoryProvider(
          create: (context) => LoginProvider(),
          child: LoginPage(),
        ));
  }
}
