import 'dart:convert';

class product {
  final String name;
  final String description;
  final double price;
  final double quantity;
  final String category;
  final List<String> images;
  final String? id;
  //final List<Rating>? rating;

  product({
    required this.name,
    required this.description,
    required this.price,
    required this.quantity,
    required this.category,
    required this.images,
    this.id,
    //this.rating,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'price': price,
      'quantity': quantity,
      'category': category,
      'images': images,
      'id': id,
      //'rating': rating
    };
  }

  factory product.fromMap(Map<String, dynamic> map) {
    return product(
      name: map['name'] ?? '',
      description: map['descriotion'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      quantity: map['quantity']?.toDouble() ?? 0.0,
      category: map['categoryl'] ?? '',
      images: List<String>.from(map['images']),
      id: map['_id'],
      //rating: map['ratings'] != null
      //? List<Rating>.from(
      // map['ratings']?.map(
      //  (x) => Rating.fromMap(x),
      //  ),
      //  )
      //  : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory product.fromJson(String source) =>
      product.fromMap(json.decode(source) as Map<String, dynamic>);
}
