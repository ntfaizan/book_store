import 'package:intl/intl.dart';

class Author {
  final int id;
  final String name;
  final String createdAt;
  final String updatedAt;
  bool isSelected;

  Author({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    this.isSelected = false,
  });

  factory Author.fromJson(Map<String, dynamic> mp) => Author(
        id: mp['id'],
        name: mp['name'],
        createdAt: DateFormat("yy-MM-dd HH:mm:ss a")
            .format(DateTime.parse(mp['created_at'])),
        updatedAt: DateFormat("yy-MM-dd HH:mm:ss a")
            .format(DateTime.parse(mp['updated_at'])),
      );
}
