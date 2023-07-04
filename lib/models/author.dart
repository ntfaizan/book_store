class Author {
  final int id;
  final String name;
  final String createdAt;
  final String updatedAt;

  Author({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Author.fromJson(Map<String, dynamic> mp) => Author(
        id: mp['id'],
        name: mp['name'],
        createdAt: mp['created_at'],
        updatedAt: mp['updated_at'],
      );
}
