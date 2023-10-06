import 'package:classRanker/core/class/crud.dart';
import 'package:classRanker/links.dart';

class UpdateStudentData {
  Crud crud;
  UpdateStudentData(this.crud);

  postUpdateStudentData(String id, String fullName, String className,
      String rank, String grade, String attendance) async {
    var response = await crud.postData(Links.updateStudent, {
      "student_id": id,
      "full_name": fullName,
      "class_name": className,
      "rank": rank,
      "grade": grade,
      "attendance": attendance,
    });
    print("Student ID: ${id}");
    print("Full Name: $fullName");
    print("Class Name: $className");
    print("Rank: ${rank.toString()}");
    print("Grade: $grade");
    print("Attendance: ${attendance.toString()}");
    return response.fold((l) => l, (r) => r);
  }
}
