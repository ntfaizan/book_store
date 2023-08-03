import 'dart:math';

import 'package:book_store/controllers/category_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/category.dart';

class CategoryPageRp extends ConsumerWidget {
   CategoryPageRp({super.key});

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
  Widget build(BuildContext context, WidgetRef ref) {
    final ccProvider = ref.watch(categoryControllerProvider);
    return Scaffold(
      body: ccProvider.when(
        data: (categoryList) => ListView.builder(
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
        error: (error, stackTrace) => Text('$stackTrace'),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
