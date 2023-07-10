import 'package:flutter/material.dart';
import 'package:json_placeholder/models/book_edition.dart';
import 'package:json_placeholder/pages/author_page.dart';
import 'package:json_placeholder/pages/book_edition_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FilledButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => const BookEditionPage()),
                );
              },
              child: const Text('Author'),
            )
          ],
        ),
      ),
    );
  }
}
