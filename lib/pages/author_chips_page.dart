import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_placeholder/models/author.dart';
import 'package:dio/dio.dart';

class AuthorChipsPage extends StatefulWidget {
  const AuthorChipsPage({super.key});

  @override
  State<AuthorChipsPage> createState() => _AuthorChipsPageState();
}

class _AuthorChipsPageState extends State<AuthorChipsPage> {
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
      body: Column(
        children: [
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: authorList.length,
              itemBuilder: (context, index) => FilterChip(
                label: Text(authorList[index].name),
                labelStyle: TextStyle(
                  color:
                      authorList[index].isSelected ? Colors.red : Colors.black,
                ),
                selected: authorList[index].isSelected,
                onSelected: (bool selected) {
                  setState(() {
                    authorList[index].isSelected =
                        !authorList[index].isSelected;
                  });
                },
                selectedColor: Colors.amberAccent,
                checkmarkColor: Colors.red,
              ),
            ),
          ),
          FilledButton(
            onPressed: () {
              List<int> aList = authorList
                  .where((e) => e.isSelected)
                  .toList()
                  .map((e) => e.id)
                  .toList();
              print(aList);
            },
            child: const Text('Submit'),
          )
        ],
      ),
    );
  }

  Future<void> getAuthors() async {
    final response = await dio.get('http://mad.codewithfaizan.com/api/authors');
    Map<String, dynamic> mp = json.decode(response.toString());
    if (mp['success']) {
      authorList = (mp['data'] as List)
          .map(
            (map) => Author.fromJson(map),
          )
          .toList();
      setState(() {});
    }
  }
}
