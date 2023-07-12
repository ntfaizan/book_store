import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:json_placeholder/network/network_client.dart';

import '../models/category.dart';

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
    final res = await NetworkClient().get('api/categories');
    if (res.statusCode == 200) {
      Map<String, dynamic> mp = json.decode(res.toString());
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
          : ListView.builder(
              itemCount: categoryList.length,
              itemBuilder: (context, index) => Card(
                child: Row(
                  children: [
                    Image.asset(
                      coverList[random.nextInt(7)],
                    ),
                    Column(
                      children: [
                        Text(categoryList[index].name),
                        Text(categoryList[index].createdAt),
                        Text(categoryList[index].updatedAt),
                      ],
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  // String datetimeFormat(String datetime) {
  //   // DateTime dt1 = DateTime.parse(datetime);
  //   // return DateFormat("EEE, d MMM yyyy HH:mm:ss").format(dt1);
  //   return DateFormat("yy-MM-dd HH:mm:ss a").format(DateTime.parse(datetime));
  // }
}
