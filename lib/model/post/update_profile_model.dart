class ProfileUpdateRequest {
  final String? gender;
  final int weight;
  final int height;
  final List<String>? eatOptions;
  final String? goal;
  final List<String>? appGoal;
  final bool allergy;
  final List<String>? allergyTypes;
  final Student student;
  final String? exercise;
  final List<String>? exerciseTypes;
  final String? dob;

  ProfileUpdateRequest({
    required this.gender,
    required this.weight,
    required this.height,
    this.eatOptions,
    this.goal,
    this.appGoal,
    required this.allergy,
    this.allergyTypes,
    required this.student,
    this.exercise,
    this.exerciseTypes,
    this.dob,
  });

  Map<String, dynamic> toJson() {
    return {
      "gender": gender,
      "weight": weight,
      "height": height,
      "eatOptions": eatOptions,
      "goal": goal,
      "appGoal": appGoal,
      "allergy": allergy,
      "allergyTypes": allergyTypes,
      "student": student.toJson(),
      "exercise": exercise,
      "exerciseTypes": exerciseTypes,
      "dob": dob,
    };
  }
}

class Student {
  final String? school;
  final String gpa;
  final String status;

  Student({
    required this.school,
    required this.gpa,
    required this.status,
  });

  Map<String, dynamic> toJson() {
    return {
      "school": school,
      "gpa": gpa,
      "status": status,
    };
  }
}
