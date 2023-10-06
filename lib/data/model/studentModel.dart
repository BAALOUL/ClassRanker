/* 
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/
class StudentModel {
  String? userid;
  String? username;
  String? email;
  String? password;
  String? phone;
  String? role;
  String? fullname;
  String? studentid;
  String? classname;
  String? rank;
  String? grade;
  String? attendance;

  StudentModel(
      {this.userid,
      this.username,
      this.email,
      this.password,
      this.phone,
      this.role,
      this.fullname,
      this.studentid,
      this.classname,
      this.rank,
      this.grade,
      this.attendance});

  StudentModel.fromJson(Map<String, dynamic> json) {
    userid = json['user_id'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
    role = json['role'];
    fullname = json['full_name'];
    studentid = json['student_id'];
    classname = json['class_name'];
    rank = json['rank'];
    grade = json['grade'];
    attendance = json['attendance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['user_id'] = userid;
    data['username'] = username;
    data['email'] = email;
    data['password'] = password;
    data['phone'] = phone;
    data['role'] = role;
    data['full_name'] = fullname;
    data['student_id'] = studentid;
    data['class_name'] = classname;
    data['rank'] = rank;
    data['grade'] = grade;
    data['attendance'] = attendance;
    return data;
  }
}
