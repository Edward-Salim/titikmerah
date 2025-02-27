class Forum {
  final String id;
  final String institutionId; // Relation by institution id
  final List<String> threadIds; // IDs of threads contained in this forum

  Forum({
    required this.id,
    required this.institutionId,
    this.threadIds = const [],
  });

  // Convert from Map
  factory Forum.fromMap(Map<String, dynamic> map) {
    return Forum(
      id: map["id"] ?? "",
      institutionId: map["institutionId"] ?? "",
      threadIds: List<String>.from(map["threadIds"] ?? []),
    );
  }

  // Convert to Map
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "institutionId": institutionId,
      "threadIds": threadIds,
    };
  }
}
