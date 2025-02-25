import 'package:flutter/material.dart';

class Institution {
  final String institutionName;
  final String institutionType;
  final String riskLevel;
  final int redReports;
  final int yellowReports;
  final int greenReports;
  final Color riskColor;
  final String location;

  Institution({
    required this.institutionName,
    required this.institutionType,
    required this.riskLevel,
    required this.redReports,
    required this.yellowReports,
    required this.greenReports,
    required this.riskColor,
    required this.location,
  });

  // Convert from Map (useful for JSON or dummy data loading)
  factory Institution.fromMap(Map<String, dynamic> map) {
    return Institution(
      institutionName: map["institutionName"] ?? "",
      institutionType: map["institutionType"] ?? "",
      riskLevel: map["riskLevel"] ?? "",
      redReports: map["redReports"] ?? 0,
      yellowReports: map["yellowReports"] ?? 0,
      greenReports: map["greenReports"] ?? 0,
      riskColor: _colorFromHex(map["riskColor"] ?? "#808080"), // Default to grey
      location: map["location"] ?? "",
    );
  }

  // Convert to Map (useful for saving to database or API)
  Map<String, dynamic> toMap() {
    return {
      "institutionName": institutionName,
      "institutionType": institutionType,
      "riskLevel": riskLevel,
      "redReports": redReports,
      "yellowReports": yellowReports,
      "greenReports": greenReports,
      "riskColor": _colorToHex(riskColor),
      "location": location,
    };
  }

  // Helper function: Convert color from hex string
  static Color _colorFromHex(String hex) {
    hex = hex.replaceAll("#", "");
    if (hex.length == 6) {
      return Color(int.parse("0xFF$hex"));
    } else {
      return Colors.grey; // Default color
    }
  }

  // Helper function: Convert color to hex string
  static String _colorToHex(Color color) {
    return "#${color.value.toRadixString(16).substring(2).toUpperCase()}";
  }
}
