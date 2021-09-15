import 'package:book_management/models/book.dart';

import 'package:http/http.dart' as http;

class BookApiProvider {
  List<Book> initBook() {
    List<Book> books = [];
    books.add(Book(id: 1, name: "ahihi", author: "Hieu", categoryId: 1, status: true));
    books.add(Book(id: 2, name: "ahihi", author: "Hieu", categoryId: 1, status: true));
    books.add(Book(id: 3, name: "ahihi", author: "Hieu", categoryId: 1, status: true));
    books.add(Book(id: 4, name: "ahihi", author: "Hieu", categoryId: 1, status: true));
    books.add(Book(id: 5, name: "ahihi", author: "Hieu", categoryId: 1, status: true));
    books.add(Book(id: 6, name: "ahihi", author: "Hieu", categoryId: 1, status: true));
    books.add(Book(id: 7, name: "ahihi", author: "Hieu", categoryId: 1, status: true));
    books.add(Book(id: 8, name: "ahihi", author: "Hieu", categoryId: 1, status: true));
    books.add(Book(id: 9, name: "ahihi", author: "Hieu", categoryId: 1, status: true));
    books.add(Book(id: 10, name: "ahihi", author: "Hieu", categoryId: 1, status: true));
    books.add(Book(id: 11, name: "ahihi", author: "Hieu", categoryId: 1, status: true));
    books.add(Book(id: 12, name: "ahihi", author: "Hieu", categoryId: 1, status: true));
    books.add(Book(id: 13, name: "ahihi", author: "Hieu", categoryId: 1, status: true));
    books.add(Book(id: 14, name: "ahihi", author: "Hieu", categoryId: 1, status: true));
    books.add(Book(id: 15, name: "ahihi", author: "Hieu", categoryId: 1, status: true));
    books.add(Book(id: 16, name: "ahihi", author: "Hieu", categoryId: 1, status: true));
    books.add(Book(id: 17, name: "ahihi", author: "Hieu", categoryId: 1, status: true));
    books.add(Book(id: 18, name: "ahihi", author: "Hieu", categoryId: 1, status: true));
    books.add(Book(id: 19, name: "ahihi", author: "Hieu", categoryId: 1, status: true));
    books.add(Book(id: 20, name: "ahihi", author: "Hieu", categoryId: 1, status: true));
    books.add(Book(id: 21, name: "ahihi", author: "Hieu", categoryId: 1, status: true));
    books.add(Book(id: 22, name: "ahihi", author: "Hieu", categoryId: 1, status: true));
    books.add(Book(id: 23, name: "ahihi", author: "Hieu", categoryId: 1, status: true));
    books.add(Book(id: 24, name: "ahihi", author: "Hieu", categoryId: 1, status: true));
    books.add(Book(id: 25, name: "ahihi", author: "Hieu", categoryId: 1, status: true));
    books.add(Book(id: 26, name: "ahihi", author: "Hieu", categoryId: 1, status: true));
    books.add(Book(id: 27, name: "ahihi", author: "Hieu", categoryId: 1, status: true));
    books.add(Book(id: 28, name: "ahihi", author: "Hieu", categoryId: 1, status: true));
    books.add(Book(id: 29, name: "ahihi", author: "Hieu", categoryId: 1, status: true));
    books.add(Book(id: 30, name: "ahihi", author: "Hieu", categoryId: 1, status: true));
    books.add(Book(id: 31, name: "ahihi", author: "Hieu", categoryId: 1, status: true));
    books.add(Book(id: 32, name: "ahihi", author: "Hieu", categoryId: 1, status: true));
    books.add(Book(id: 33, name: "ahihi", author: "Hieu", categoryId: 1, status: true));
    books.add(Book(id: 34, name: "ahihi", author: "Hieu", categoryId: 1, status: true));
    books.add(Book(id: 35, name: "ahihi", author: "Hieu", categoryId: 1, status: true));
    books.add(Book(id: 36, name: "ahihi", author: "Hieu", categoryId: 1, status: true));
    books.add(Book(id: 37, name: "ahihi", author: "Hieu", categoryId: 1, status: true));
    return books;
  }

  Future<List<Book>> getBookList(int from, int to) async {
    // String apiUrl = "";
    // final response = await http
    //     .get(Uri.parse(apiUrl + ""));
    final books = initBook();
    List<Book> booksPaging = [];
    if(from == books.length) {
      return [];
    }
    int count = from + to;
    if (count < books.length)
    count = books.length;
    for (int i = from; i < count ; i++) {
      booksPaging.add(books[i]);
    }
    if (booksPaging.length > 0) {
      return booksPaging;
    } else {
      throw Exception('Failed to load post');
    }
  }
}