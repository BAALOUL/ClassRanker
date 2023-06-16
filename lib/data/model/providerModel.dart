/* 
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/
class ProviderModel {
  String? providerid;
  String? providername;
  String? providernamear;
  String? provideruserid;
  String? providerstatus;
  String? providerrating;
  String? providerwhatsapp;
  String? providerwebsite;
  String? providercompleted;
  String? providercurrent;
  String? providercanceled;
  String? providerimage;
  String? provideraccepted;
  String? providerrejected;
  String? providerlatitude;
  String? providerlongitude;

  ProviderModel(
      {this.providerid,
      this.providername,
      this.providernamear,
      this.provideruserid,
      this.providerstatus,
      this.providerrating,
      this.providerwhatsapp,
      this.providerwebsite,
      this.providercompleted,
      this.providercurrent,
      this.providercanceled,
      this.providerimage,
      this.provideraccepted,
      this.providerrejected,
      this.providerlatitude,
      this.providerlongitude});

  ProviderModel.fromJson(Map<String, dynamic> json) {
    providerid = json['provider_id'];
    providername = json['provider_name'];
    providernamear = json['provider_name_ar'];
    provideruserid = json['provider_user_id'];
    providerstatus = json['provider_status'];
    providerrating = json['provider_rating'];
    providerwhatsapp = json['provider_whatsapp'];
    providerwebsite = json['provider_website'];
    providercompleted = json['provider_completed'];
    providercurrent = json['provider_current'];
    providercanceled = json['provider_canceled'];
    providerimage = json['provider_image'];
    provideraccepted = json['provider_accepted'];
    providerrejected = json['provider_rejected'];
    providerlatitude = json['provider_latitude'];
    providerlongitude = json['provider_longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['provider_id'] = providerid;
    data['provider_name'] = providername;
    data['provider_name_ar'] = providernamear;
    data['provider_user_id'] = provideruserid;
    data['provider_status'] = providerstatus;
    data['provider_rating'] = providerrating;
    data['provider_whatsapp'] = providerwhatsapp;
    data['provider_website'] = providerwebsite;
    data['provider_completed'] = providercompleted;
    data['provider_current'] = providercurrent;
    data['provider_canceled'] = providercanceled;
    data['provider_image'] = providerimage;
    data['provider_accepted'] = provideraccepted;
    data['provider_rejected'] = providerrejected;
    data['provider_latitude'] = providerlatitude;
    data['provider_longitude'] = providerlongitude;
    return data;
  }
}
