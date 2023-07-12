import 'package:book_store/models/publisher.dart';

import 'author.dart';

class Book {
  final int id;
  final String title;
  final String coverUrl;
  final String edition;
  final int quantity;
  final int unitPrice;
  final String unitCurrency;
  final List<Author> authorList;
  final Publisher publisher;

  Book({
    required this.id,
    required this.title,
    required this.coverUrl,
    required this.edition,
    required this.quantity,
    required this.unitPrice,
    required this.unitCurrency,
    required this.publisher,
    required this.authorList,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['book']['id'],
      title: json['book']['title'],
      coverUrl: json['cover_url'],
      edition: json['edition'],
      quantity: json['quantity'],
      unitPrice: json['unit_price'],
      unitCurrency: json['unit_currency'],
      publisher: Publisher.fromJson(json['publisher']),
      authorList:
          (json['authors'] as List).map((e) => Author.fromJson(e)).toList(),
    );
  }
}
