import 'package:intl/intl.dart';

class Category {
  final int id;
  final String name;
  final String createdAt;
  final String updatedAt;

  Category({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> mp) => Category(
        id: mp['id'],
        name: mp['name'],
        createdAt: DateFormat("yy-MM-dd HH:mm:ss a")
            .format(DateTime.parse(mp['created_at'])),
        updatedAt: DateFormat("yy-MM-dd HH:mm:ss a")
            .format(DateTime.parse(mp['updated_at'])),
      );

  // EEE, d MMM yyyy HH:mm:ss
  // yy-MM-dd HH:mm:ss a
}
