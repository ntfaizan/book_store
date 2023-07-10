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
        createdAt: mp['created_at'],
        updatedAt: mp['updated_at'],
      );
}
