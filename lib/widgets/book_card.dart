import 'package:flutter/material.dart';

import '../models/book_edition.dart';

class BookCard extends StatelessWidget {
  final BookEdition bookEdition;
  const BookCard({super.key, required this.bookEdition});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(bookEdition.coverUrl),
          Stack(
            children: [],
          ),
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
