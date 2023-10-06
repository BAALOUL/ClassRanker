class StudentModel {
  String? id;
  String? username;
  String? password;
  String? fullName; // Renamed to camelCase
  String? className; // Renamed to camelCase
  String? rank;
  String? grade; // Added grade field
  String? attendance; // Added attendance field
  String? email; // Added email field
  String? phone; // Added phone field

  StudentModel({
    this.id,
    this.username,
    this.password,
    this.fullName,
    this.className,
    this.rank,
    this.grade, // Added grade field
    this.attendance, // Added attendance field
    this.email, // Added email field
    this.phone, // Added phone field
  });

  StudentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    password = json['password'];
    fullName = json['full_name'];
    className = json['class_name'];
    rank = json['rank'];
    grade = json['grade']; // Added grade field
    attendance = json['attendance']; // Added attendance field
    email = json['email']; // Added email field
    phone = json['phone']; // Added phone field
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['password'] = password;
    data['full_name'] = fullName;
    data['class_name'] = className;
    data['rank'] = rank;
    data['grade'] = grade; // Added grade field
    data['attendance'] = attendance; // Added attendance field
    data['email'] = email; // Added email field
    data['phone'] = phone; // Added phone field
    return data;
  }
}
