// ignore: file_names
class Categories {
  String? idCategories;
  String? nameEnCategories;
  String? nameArCategories;
  String? imageCategories;
  String? datetimeCategories;

  Categories(
      {this.idCategories,
      this.nameEnCategories,
      this.nameArCategories,
      this.imageCategories,
      this.datetimeCategories});

  Categories.fromJson(Map<String, dynamic> json) {
    idCategories = json['id_categories'];
    nameEnCategories = json['name_en_categories'];
    nameArCategories = json['name_ar_categories'];
    imageCategories = json['image_categories'];
    datetimeCategories = json['datetime_categories'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_categories'] = this.idCategories;
    data['name_en_categories'] = this.nameEnCategories;
    data['name_ar_categories'] = this.nameArCategories;
    data['image_categories'] = this.imageCategories;
    data['datetime_categories'] = this.datetimeCategories;
    return data;
  }
}
