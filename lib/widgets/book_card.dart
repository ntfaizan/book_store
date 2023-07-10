import 'package:flutter/material.dart';

import '../models/book.dart';

class BookCard extends StatelessWidget {
  final Book bookEdition;
  const BookCard({super.key, required this.bookEdition});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(bookEdition.coverUrl),
          Positioned(
            child: Text(bookEdition.edition),
          ),
          Text('Available Stock ${bookEdition.quantity}'),
          Text('${bookEdition.unitPrice} ${bookEdition.unitCurrency}'),
        ],
      ),
    );
  }
}
