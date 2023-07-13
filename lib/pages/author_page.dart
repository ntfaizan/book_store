import 'dart:convert';

import 'package:flutter/material.dart';

import '../models/author.dart';
import '../network/network_client.dart';
import '../widgets/author_card.dart';

class AuthorPage extends StatefulWidget {
  const AuthorPage({super.key});

  @override
  State<AuthorPage> createState() => _AuthorPageState();
}

class _AuthorPageState extends State<AuthorPage> {
  List<Author> authorList = [];

  @override
  void initState() {
    initData();
    super.initState();
  }

  Future<void> initData() async {
    final response = await NetworkClient().get('api/authors');
    Map<String, dynamic> mp = json.decode(response.toString());
    if (response.statusCode == 200) {
      authorList = (mp['data'] as List)
          .map(
            (m) => Author.fromJson(m),
          )
          .toList();
      setState(() {});
    }
  }

  void deleteData(int id) {
    authorList.removeWhere((e) => e.id == id);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Author Page'),
      ),
      body: authorList.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: authorList.length,
              itemBuilder: (context, index) => AuthorCard(
                author: authorList[index],
                deleteData: deleteData,
              ),
            ),
    );
  }
}
