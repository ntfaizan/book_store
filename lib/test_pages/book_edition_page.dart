import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../models/book.dart';

class BookEditionPage extends StatefulWidget {
  const BookEditionPage({super.key});

  @override
  State<BookEditionPage> createState() => _BookEditionPageState();
}

class _BookEditionPageState extends State<BookEditionPage> {
  List<Book> bookEditionList = [];
  final dio = Dio();

  @override
  void initState() {
    initData();
    super.initState();
  }

  Future<void> initData() async {
    final res = await dio.get(
      'http://mad.codewithfaizan.com/api/books',
      queryParameters: {'max_price': 350},
    );
    Map<String, dynamic> mp = jsonDecode(res.toString());
    if (mp['success']) {
      bookEditionList =
          (mp['data'] as List).map((e) => Book.fromJson(e)).toList();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bookEditionList.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: bookEditionList.length,
                  itemBuilder: (context, index) =>
                      Text(bookEditionList[index].edition)
                  // BookCard(
                  //   bookEdition: bookEditionList[index],
                  // ),
                  ),
            ),
    );
  }
}
