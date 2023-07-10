class Book {
  final String coverUrl;
  final String edition;
  final int quantity;
  final int unitPrice;
  final String unitCurrency;

  Book({
    required this.coverUrl,
    required this.edition,
    required this.quantity,
    required this.unitPrice,
    required this.unitCurrency,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      coverUrl: json['cover_url'],
      edition: json['edition'],
      quantity: json['quantity'],
      unitPrice: json['unit_price'],
      unitCurrency: json['unit_currency'],
    );
  }
}
