import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_placeholder/models/author.dart';
import 'package:json_placeholder/widgets/author_card.dart';
import 'package:dio/dio.dart';

class AuthorPage extends StatefulWidget {
  const AuthorPage({super.key});

  @override
  State<AuthorPage> createState() => _AuthorPageState();
}

class _AuthorPageState extends State<AuthorPage> {
  List<Author> authorList = [];
  final dio = Dio();

  @override
  void initState() {
    getAuthors();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Author Page'),
      ),
      body: ListView.builder(
        itemCount: authorList.length,
        itemBuilder: (context, index) => AuthorCard(author: authorList[index]),
      ),
    );
  }

  Future<void> getAuthors() async {
    final response = await dio.get('http://mad.codewithfaizan.com/api/authors');
    Map<String, dynamic> mp = json.decode(response.toString());
    if (mp['success']) {
      authorList = (mp['data'] as List)
          .map(
            (m) => Author.fromJson(m),
          )
          .toList();
      setState(() {});
    }
  }
}
