import 'package:flutter/material.dart';

import '../models/author.dart';

class AuthorCard extends StatelessWidget {
  final Author author;
  const AuthorCard({super.key, required this.author});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${author.id} ${author.name}'),
          Text(author.createdAt),
          Text(author.updatedAt),
        ],
      ),
    );
  }
}
