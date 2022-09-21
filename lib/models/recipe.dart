import 'package:flutter/material.dart';

class Recipe {
  final String name;
  final String images;
  final double rating;
  final String totalTime;

  const Recipe(this.name, this.images, this.rating, this.totalTime);

  factory Recipe.fromJSON(dynamic json) {
    return Recipe(
        name: json['name'] as String,
        images: json['images'][0]['hostedLargeUrl'] as String,
        rating: json['rating'] as double,
        totalTime: json['totalTime'] as String);
  }
  static List<Recipe> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Recipe.fromJSON(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Recipe {name: $name,images: $images,rating: $rating,totalTime: $totalTime}';
  }
}