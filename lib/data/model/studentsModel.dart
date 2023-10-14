/* 
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/
class StudentsModel {
  String? id;
  DateTime? createdAt;

  StudentsModel({this.id, this.createdAt});

  StudentsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['createdAt'] = createdAt;
    return data;
  }
}
