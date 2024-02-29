class Target {
   int? id;
   String name;
   String category;
   int weight;
  DateTime startDate;
  DateTime endDate;
  String status;

  Target({
    this.id,
    required this.name,
    required this.category,
    required this.weight,
    required this.startDate,
    required this.endDate,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'weight': weight,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'status': status,
    };
  }

  factory Target.fromMap(Map<String, dynamic> map) {
    return Target(
      id: map['id'],
      name: map['name'],
      category: map['category'],
      weight: map['weight'],
      startDate: DateTime.parse(map['startDate']),
      endDate: DateTime.parse(map['endDate']),
      status: map['status'],
    );
  }
}
