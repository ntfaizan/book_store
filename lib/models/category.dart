class Category {
  final int id;
  final String name;
  final String createdAt;
  final String updatedAt;
  bool isSelected;

  Category({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    this.isSelected = false,
  });

  factory Category.fromJson(Map<String, dynamic> mp) => Category(
        id: mp['id'],
        name: mp['name'],
        createdAt: mp['created_at'],
        updatedAt: mp['updated_at'],
      );
}
