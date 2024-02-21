import 'dart:convert';

class ItemData {
  final String name;
  final String? description;

  ItemData({
    required this.name,
    this.description,
  });

  String get value => description ?? name;

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
    };
  }

  factory ItemData.fromMap(Map<String, dynamic> map) {
    return ItemData(
      name: map['name'] ?? '',
      description: map['description'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemData.fromJson(String source) =>
      ItemData.fromMap(json.decode(source));
}
