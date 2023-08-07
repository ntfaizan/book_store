import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/category.dart';
import '../network/network_client.dart';

part 'category_controller.g.dart';

@riverpod
class CategoryController extends _$CategoryController {
  @override
  FutureOr<List<Category>> build() async {
    return await _getCategoryList();
  }

  FutureOr<List<Category>> _getCategoryList() async {
    final res = await NetworkClient().get('api/categories');
    if (res.statusCode == 200) {
      Map<String, dynamic> mp = json.decode(res.toString());
      return (mp['data'] as List)
          .map(
            (m) => Category.fromJson(m),
          )
          .toList();
    } else {
      return [];
    }
  }

  Future<void> deleteCategory(int id) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await NetworkClient().delete('api/categories/$id');
      return _getCategoryList();
    });
  }
}
