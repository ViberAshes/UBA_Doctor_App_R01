class Doctor {
  String Uid;
  String name;
  String qualification;
  String degree;
  String field;
  String details;

  Doctor(
      {required this.Uid,
      required this.name,
      required this.qualification,
      required this.degree,
      required this.field,
      required this.details});

  toJson() {
    return {
      'Uid': Uid,
      'name': name,
      'qualification': qualification,
      'degree': degree,
      'field': field,
      'details': details,
    };
  }

  // Convert user data to a map
  Map<String, dynamic> toMap() {
    return {
      'Uid': Uid,
      'name': name,
      'qualification': qualification,
      'degree': degree,
      'field': field,
      'details': details,
    };
  }

  // Create user data from a map
  factory Doctor.fromMap(Map<String, dynamic> map) {
    return Doctor(
      name: map['name'],
      Uid: map['Uid'],
      qualification: map['qualification'],
      degree: map['degree'],
      field: map['field'],
      details: map['details'],
    );
  }
}
