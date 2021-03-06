import 'package:book_management/blocs/book_form/book_form_bloc.dart';
import 'package:book_management/blocs/book_form/book_form_evet.dart';
import 'package:book_management/blocs/book_list/book_list_bloc.dart';
import 'package:book_management/models/book.dart';
import 'package:book_management/ui/update_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookItem extends StatelessWidget {
  final Book book;
  const BookItem({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BookListBloc bookBloc = BlocProvider.of<BookListBloc>(context);
    BookFormBloc bookFormBloc = BlocProvider.of<BookFormBloc>(context);
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Material(
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute<UpdateBook>(
                builder: (context) {
                  return MultiBlocProvider(
                    providers: [
                      BlocProvider<BookFormBloc>.value(
                          value: bookFormBloc..add(GetBook(book: book))),
                      BlocProvider<BookListBloc>.value(value: bookBloc),
                    ],
                    child: UpdateBookPage(bookId: book.id),
                  );
                },
              ),
            );
          },
          child: Row(
            children: [
              Container(
                height: 160,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10)),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "https://images.unsplash.com/photo-1543002588-bfa74002ed7e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8MXx8fGVufDB8fHx8&w=1000&q=80"),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 2),
                          width: 80,
                          child: Text(
                            "Book ID:",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(book.id.toString())
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 2),
                          width: 80,
                          child: Text(
                            "Name:",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(book.name.toString())
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 2),
                          width: 80,
                          child: Text(
                            "Author:",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(book.author.toString())
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 2),
                          width: 80,
                          child: Text(
                            "Category:",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(book.category.toString())
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 80,
                          child: Text(
                            "Description:",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          width: 135,
                          child: Text(
                            "Nh?? b???n v???n th?????ng bi???t Text d??ng ????? hi???n th??? 1 chu???i, hay 1 ??o???n v??n b???n v???i 1 style duy nh???t. Vi???c hi???n th??? n??y c?? th??? tr??n 1 d??ng, nhi???u d??ng t??y v??o c??ch b???n ?????nh d???ng style cho n??. ????? ?????nh d???ng style cho Text b???n s??? d???ng thu???c t??nh style c???a Text, ????y l?? 1 thu???c t??nh optional. N???u b???n kh??ng s??? d???ng style, m???c ?????nh Text s??? ???????c set style l?? DefaultTextStyle",
                            textAlign: TextAlign.justify,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 2),
                          width: 80,
                          child: Text(
                            "Date:",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(book.publishedDate.toString() == "null"
                            ? ""
                            : book.publishedDate.toString())
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
