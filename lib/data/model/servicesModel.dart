class Services {
  String? serviceid;
  String? servicename;
  String? servicenamear;
  String? serviceproviderid;
  String? servicedescription;
  String? price;

  Services(
      {this.serviceid,
      this.servicename,
      this.servicenamear,
      this.serviceproviderid,
      this.servicedescription,
      this.price});

  Services.fromJson(Map<String, dynamic> json) {
    serviceid = json['service_id'];
    servicename = json['service_name'];
    servicenamear = json['service_name_ar'];
    serviceproviderid = json['service_provider_id'];
    servicedescription = json['service_description'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['service_id'] = serviceid;
    data['service_name'] = servicename;
    data['service_name_ar'] = servicenamear;
    data['service_provider_id'] = serviceproviderid;
    data['service_description'] = servicedescription;
    data['price'] = price;
    return data;
  }
}
