class Shoe {
  int? id;
  String? name;
  double? price;
  String? category;
  String? brand;
  String? description;
  String? imageUrl;

  Shoe({
    this.id,
    this.name,
    this.price,
    this.category,
    this.brand,
    this.description,
    this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'category': category,
      'brand': brand,
      'description': description,
      'imageUrl': imageUrl,
    };
  }

  factory Shoe.fromMap(dynamic map) {
    if (null == map) return Shoe();
    var temp;
    return Shoe(
      id: null == (temp = map['id']) ? null : (temp is num ? temp.toInt() : int.tryParse(temp)),
      name: map['name']?.toString(),
      price: null == (temp = map['price']) ? null : (temp is num ? temp.toDouble() : double.tryParse(temp)),
      category: map['category']?.toString(),
      brand: map['brand']?.toString(),
      description: map['description']?.toString(),
      imageUrl: map['imageUrl']?.toString(),
    );
  }
}
