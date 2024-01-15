import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:votesyncapp/vs_models/student_model.dart';
final studentProvider = StateNotifierProvider<StudentNotifier,Student>((ref) => StudentNotifier());

class StudentNotifier extends StateNotifier<Student>{
  StudentNotifier() : super(Student("", "","","", null,null));

  void updateStudent(Student student){
    state=student;
  }
}