import 'package:book_management/models/book.dart';
import 'package:book_management/ui/update_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookItem extends StatelessWidget {
  final Book book;
  const BookItem({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Color(0xffffffff),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => UpdateBookPage(bookId: book.id,)),
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
                          "Như bạn vẫn thường biết Text dùng để hiển thị 1 chuỗi, hay 1 đoạn văn bản với 1 style duy nhất. Việc hiển thị này có thể trên 1 dòng, nhiều dòng tùy vào cách bạn định dạng style cho nó. Để định dạng style cho Text bạn sử dụng thuộc tính style của Text, đây là 1 thuộc tính optional. Nếu bạn không sử dụng style, mặc định Text sẽ được set style là DefaultTextStyle",
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
    );
  }
}
