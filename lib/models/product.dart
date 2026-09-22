import 'package:flutter/material.dart';

class Product {
  final int id;
  final String name;
  final double price;
  final String category;
  final IconData icon;
  final String? description;

  const Product({
    required this.id,
    required this.name,
    required this.price,
    required this.category,
    required this.icon,
    this.description,
  });

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] as int,
      name: map['name'] as String,
      price: (map['price'] as num).toDouble(),
      category: map['category'] as String,
      icon: map['icon'] as IconData,
      description: map['description'] as String?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'category': category,
      'icon': icon,
      if (description != null) 'description': description,
    };
  }

  Product copyWith({
    int? id,
    String? name,
    double? price,
    String? category,
    IconData? icon,
    String? description,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      category: category ?? this.category,
      icon: icon ?? this.icon,
      description: description ?? this.description,
    );
  }
}
