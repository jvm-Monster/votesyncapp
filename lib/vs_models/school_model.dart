class School{
  String? schoolId;
  String? schoolName;
  String? state;

  School(this.schoolId,this.schoolName,this.state);
  // Convert the object to a map for encoding to JSON
  Map<String, dynamic> toJson() {
    return {
      'schoolId': schoolId,
      'schoolName': schoolName,
      'state': state
    };
  }

  // Create a factory constructor that takes a map for decoding from JSON
  factory School.fromJson(Map<String, dynamic> json) {
    return School(
      json['schoolId'],
      json['schoolName'],
      json['state'],
    );
  }

  @override
  String toString() {
    return ' $schoolId - $schoolName - $state';
  }
}