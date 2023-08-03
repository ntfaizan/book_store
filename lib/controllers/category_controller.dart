import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/category.dart';
import '../network/network_client.dart';

part 'category_controller.g.dart';

@riverpod
class CategoryController extends _$CategoryController {
  @override
  Future<List<Category>> build() async {
    return await _fatchCategoryList();
  }

  Future<List<Category>> _fatchCategoryList() async {
    final res = await NetworkClient().get('api/categories');
    if (res.statusCode == 200) {
      Map<String, dynamic> mp = json.decode(res.toString());
      return (mp['data'] as List)
          .map(
            (m) => Category.fromJson(m),
          )
          .toList();
    }else{
      return [];
    }
  }
}
