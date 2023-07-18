/* 
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/
class ServiceSectionModel {
  String? sectionid;
  String? sectionname;
  String? sectionnamear;
  String? sectionimage;
  String? serviceid;
  String? servicename;
  String? servicenamear;
  String? servicedescription;
  String? servicecategoryid;
  String? servicesectionid;
  String? servicestatus;
  String? serviceimage;

  ServiceSectionModel(
      {this.sectionid,
      this.sectionname,
      this.sectionnamear,
      this.sectionimage,
      this.serviceid,
      this.servicename,
      this.servicenamear,
      this.servicedescription,
      this.servicecategoryid,
      this.servicesectionid,
      this.servicestatus,
      this.serviceimage});

  ServiceSectionModel.fromJson(Map<String, dynamic> json) {
    sectionid = json['section_id'];
    sectionname = json['section_name'];
    sectionnamear = json['section_name_ar'];
    sectionimage = json['section_image'];
    serviceid = json['service_id'];
    servicename = json['service_name'];
    servicenamear = json['service_name_ar'];
    servicedescription = json['service_description'];
    servicecategoryid = json['service_category_id'];
    servicesectionid = json['service_section_id'];
    servicestatus = json['service_status'];
    serviceimage = json['service_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['section_id'] = sectionid;
    data['section_name'] = sectionname;
    data['section_name_ar'] = sectionnamear;
    data['section_image'] = sectionimage;
    data['service_id'] = serviceid;
    data['service_name'] = servicename;
    data['service_name_ar'] = servicenamear;
    data['service_description'] = servicedescription;
    data['service_category_id'] = servicecategoryid;
    data['service_section_id'] = servicesectionid;
    data['service_status'] = servicestatus;
    data['service_image'] = serviceimage;
    return data;
  }
}
