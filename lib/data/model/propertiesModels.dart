class PropertiesModel {
  String? id;
  String? commune;
  String? typePropertie;
  String? operationPropertie;
  String? nameEnPropertie;
  String? nameArPropertie;
  String? descriptionPropertie;
  String? descriptionArPropertie;
  String? pricePropertie;
  String? bedromPropertie;
  String? forniturePropertie;
  String? bathromPropertie;
  String? sizePropertie;
  String? livingPropertie;
  String? locationPropertie;
  String? vuePropertie;
  String? imageDefaultPropertie;

  PropertiesModel(
      {this.id,
      this.commune,
      this.typePropertie,
      this.operationPropertie,
      this.nameEnPropertie,
      this.nameArPropertie,
      this.descriptionPropertie,
      this.descriptionArPropertie,
      this.pricePropertie,
      this.bedromPropertie,
      this.forniturePropertie,
      this.bathromPropertie,
      this.sizePropertie,
      this.livingPropertie,
      this.locationPropertie,
      this.vuePropertie,
      this.imageDefaultPropertie});

  PropertiesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    commune = json['commune'];
    typePropertie = json['type_propertie'];
    operationPropertie = json['operation_propertie'];
    nameEnPropertie = json['name_en_propertie'];
    nameArPropertie = json['name_ar_propertie'];
    descriptionPropertie = json['description_propertie'];
    descriptionArPropertie = json['description_ar_propertie'];
    pricePropertie = json['price_propertie'];
    bedromPropertie = json['bedrom_propertie'];
    forniturePropertie = json['forniture_propertie'];
    bathromPropertie = json['bathrom_propertie'];
    sizePropertie = json['size_propertie'];
    livingPropertie = json['living_propertie'];
    locationPropertie = json['location_propertie'];
    vuePropertie = json['vue_propertie'];
    imageDefaultPropertie = json['image_default_propertie'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['commune'] = this.commune;
    data['type_propertie'] = this.typePropertie;
    data['operation_propertie'] = this.operationPropertie;
    data['name_en_propertie'] = this.nameEnPropertie;
    data['name_ar_propertie'] = this.nameArPropertie;
    data['description_propertie'] = this.descriptionPropertie;
    data['description_ar_propertie'] = this.descriptionArPropertie;
    data['price_propertie'] = this.pricePropertie;
    data['bedrom_propertie'] = this.bedromPropertie;
    data['forniture_propertie'] = this.forniturePropertie;
    data['bathrom_propertie'] = this.bathromPropertie;
    data['size_propertie'] = this.sizePropertie;
    data['living_propertie'] = this.livingPropertie;
    data['location_propertie'] = this.locationPropertie;
    data['vue_propertie'] = this.vuePropertie;
    data['image_default_propertie'] = this.imageDefaultPropertie;
    return data;
  }
}
