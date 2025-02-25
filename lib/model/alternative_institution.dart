class AlternativeInstitution {
  final String institutionName;
  final int reportCount;
  final double distance; // Distance in km

  AlternativeInstitution({
    required this.institutionName,
    required this.reportCount,
    required this.distance,
  });

  // Convert from Map (useful for JSON, API, or dummy data loading)
  factory AlternativeInstitution.fromMap(Map<String, dynamic> map) {
    return AlternativeInstitution(
      institutionName: map["institutionName"] ?? "",
      reportCount: map["reportCount"] ?? 0,
      distance: (map["distance"] ?? 0.0).toDouble(),
    );
  }

  // Convert to Map (useful for saving to database or API)
  Map<String, dynamic> toMap() {
    return {
      "institutionName": institutionName,
      "reportCount": reportCount,
      "distance": distance,
    };
  }
}
