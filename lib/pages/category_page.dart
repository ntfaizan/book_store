import 'dart:math';

import 'package:flutter/material.dart';
import 'package:json_placeholder/network/network_client.dart';

import '../models/category.dart';
import 'book_page.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  List<String> coverList = [
    'assets/images/bBlack.jpg',
    'assets/images/bBlue.jpg',
    'assets/images/bBrown.jpg',
    'assets/images/bGreen.jpg',
    'assets/images/bOrange.jpg',
    'assets/images/bPurple.jpg',
    'assets/images/bRed.jpg',
    'assets/images/bYellow.jpg',
  ];
  List<Category> categoryList = [];
  Random random = Random();

  @override
  void initState() {
    initData();
    super.initState();
  }

  Future<void> initData() async {
    Map<String, dynamic> mp = await NetworkClient().get('api/categories');
    if (mp['success']) {
      categoryList = (mp['data'] as List)
          .map(
            (m) => Category.fromJson(m),
          )
          .toList();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Store'),
        centerTitle: true,
      ),
      body: categoryList.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : GridView.builder(
              itemCount: categoryList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) => InkWell(
                onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const BookPage())),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Image.asset(
                          coverList[random.nextInt(7)],
                        ),
                        Positioned(
                          top: 17,
                          right: 17,
                          child: Text(
                            categoryList[index].name,
                            style: const TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
