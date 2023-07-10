class BookEdition {
  final String coverUrl;
  final String edition;
  final int quantity;
  final int unitPrice;
  final String unitCurrency;

  BookEdition({
    required this.coverUrl,
    required this.edition,
    required this.quantity,
    required this.unitPrice,
    required this.unitCurrency,
  });

  factory BookEdition.fromJson(Map<String, dynamic> json) {
    return BookEdition(
      coverUrl: json['cover_url'],
      edition: json['edition'],
      quantity: json['quantity'],
      unitPrice: json['unit_price'],
      unitCurrency: json['unit_currency'],
    );
  }
}
