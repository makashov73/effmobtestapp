class Dishes {
  final int? weight;
  final int? id;
  final int? price;
  final String? image;
  final String? description;
  final String? name;
  final List<dynamic>? tags;

  Dishes(
      {this.weight,
      this.id,
      this.price,
      this.image,
      this.description,
      this.name,
      this.tags});

  factory Dishes.fromJson(Map<String, dynamic> json) {
    return Dishes(
        id: json['id'] as int,
        name: json['name'] as String,
        image: json['image_url'] as String,
        weight: json['weight'] as int,
        price: json['price'] as int,
        description: json['description'] as String,
        tags: json['tegs'] as List<dynamic>);
  }
}
