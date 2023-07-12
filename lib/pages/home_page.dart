import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_placeholder/widgets/book_card.dart';
import 'package:json_placeholder/widgets/home_drawer.dart';

import '../models/book.dart';
import '../network/network_client.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;
  int nextPageCallAt = -1;
  String? nextPageUrl;
  List<Book> bookList = [];

  @override
  void initState() {
    bookList.clear();
    initData();
    super.initState();
  }

  Future<void> initData() async {
    if (currentPage > 0 && nextPageUrl == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('No more books found')));
    } else {
      final res =
          await NetworkClient().get('api/books?page=${currentPage + 1}');
      if (res.statusCode == 200) {
        Map<String, dynamic> mp = json.decode(res.toString());
        currentPage = mp['current_page'];
        nextPageUrl = mp['next_page_url'];
        nextPageCallAt = mp['to'] - (mp['per_page'] ~/ 5);
        bookList.addAll((mp['data'] as List)
            .map(
              (m) => Book.fromJson(m),
            )
            .toList());
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const HomeDrawer(),
      appBar: AppBar(
        title: const Text('Books Library'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart_checkout),
          ),
        ],
      ),
      body: bookList.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: bookList.length,
              itemBuilder: (context, index) {
                if (index == nextPageCallAt) {
                  initData();
                }
                return BookCard(book: bookList[index]);
              },
            ),
    );
  }
}
