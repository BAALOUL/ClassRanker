class Links {
  static const String server = "https://baalsoft.com/ClassRanker";
  static const String test = "$server/test.php";

  //auth
  static const String signup = "$server/auth/signup.php";
  static const String login = "$server/auth/login.php";
  static const String verifycodeSignUp = "$server/auth/verfiycode.php";
  static const String tokenUpdate = "$server/auth/tokenUpdate.php";
  static const String getStudentsList = "https://reqres.in/api/users?page=1";

  //Students
  static const String selectStudentById = "$server/auth/signup.php";
  static const String selectStudentsByClass =
      "$server/Admins/getStudentsByClass.php";
  static const String deleteStudent = "$server/Admins/deleteStudent.php";
  static const String updateStudent = "$server/Admins/updateStudent.php";
  static const String createStudent = "$server/Admins/createStudent.php";
  static const String getRank = "$server/Students/getRank.php";
  static const String searchStudent = "$server/Admins/selectStudents.php";
}
