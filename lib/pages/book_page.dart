import 'package:flutter/material.dart';

import '../models/book.dart';
import '../network/network_client.dart';

class BookPage extends StatefulWidget {
  const BookPage({super.key});

  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  List<Book> bookList = [];

  @override
  void initState() {
    initData();
    super.initState();
  }

  Future<void> initData() async {
    Map<String, dynamic> mp = await NetworkClient().get('api/categories');
    if (mp['success']) {
      bookList = (mp['data'] as List)
          .map(
            (m) => Book.fromJson(m),
          )
          .toList();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BSI'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: bookList.length,
        itemBuilder: (context, index) => Card(
          child: Row(
            children: [],
          ),
        ),
      ),
    );
  }
}
