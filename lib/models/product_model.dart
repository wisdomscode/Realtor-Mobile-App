class ProductModel {
  final String itemId;
  final String name;
  final String price;
  final String rating;
  final List<String> tags;
  final List<String> sizes;
  final List<String> colors;
  final String description;
  final String image;

  ProductModel({
    required this.itemId,
    required this.name,
    required this.price,
    required this.rating,
    required this.tags,
    required this.sizes,
    required this.colors,
    required this.description,
    required this.image,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    List<String> parseList(dynamic value) {
      if (value is List) {
        return List<String>.from(value);
      } else if (value is String) {
        // Remove brackets and split by comma
        return value.replaceAll('[', '').replaceAll(']', '').split(',').map((e) => e.trim()).toList();
      } else {
        return [];
      }
    }

    return ProductModel(
      itemId: json['item_id'].toString(),
      name: json['name'],
      price: json['price'],
      rating: json['rating'],
      tags: parseList(json['tags']),
      sizes: parseList(json['sizes']),
      colors: parseList(json['colors']),
      description: json['description'],
      image: json['image'],
    );
  }
}
