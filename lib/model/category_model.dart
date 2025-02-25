import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryModel {
  final String name;
  final IconData icon;
  final Color color;

  CategoryModel({required this.name, required this.icon, required this.color});

  // Static categories (Dummy Data)
  static final List<CategoryModel> categories = [
    CategoryModel(
      name: "Korupsi",
      icon: CupertinoIcons.exclamationmark_triangle_fill,
      color: Colors.red,
    ),
    CategoryModel(
      name: "Positif",
      icon: CupertinoIcons.checkmark_seal_fill,
      color: Colors.green,
    ),
    CategoryModel(
      name: "Update",
      icon: CupertinoIcons.arrow_2_circlepath,
      color: Colors.blue,
    ),
    CategoryModel(
      name: "Lainnya",
      icon: CupertinoIcons.info_circle_fill,
      color: Colors.grey,
    ),
  ];

  // Get a category by name
  static CategoryModel getCategory(String name) {
    return categories.firstWhere(
      (category) => category.name == name,
      orElse: () => categories.last, // Defaults to "Lainnya"
    );
  }
}
