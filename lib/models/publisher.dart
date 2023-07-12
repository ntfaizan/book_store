import 'package:intl/intl.dart';

class Publisher {
  final int id;
  final String name;
  final String createdAt;
  final String updatedAt;

  Publisher({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Publisher.fromJson(Map<String, dynamic> mp) => Publisher(
        id: mp['id'],
        name: mp['name'],
        createdAt: DateFormat("yy-MM-dd HH:mm:ss a")
            .format(DateTime.parse(mp['created_at'])),
        updatedAt: DateFormat("yy-MM-dd HH:mm:ss a")
            .format(DateTime.parse(mp['updated_at'])),
      );
}
