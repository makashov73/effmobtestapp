class Data {
  final int id;
  final String name;
  final String image;

  Data({required this.id, required this.name, required this.image});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
        id: json['id'] as int,
        name: json['name'] as String,
        image: json['image_url'] as String);
  }
}
