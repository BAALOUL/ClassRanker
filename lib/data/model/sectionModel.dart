class Section {
  String? sectionid;
  String? sectionname;
  String? sectionnamear;
  String? sectionimage;

  Section(
      {this.sectionid,
      this.sectionname,
      this.sectionnamear,
      this.sectionimage});

  Section.fromJson(Map<String, dynamic> json) {
    sectionid = json['section_id'];
    sectionname = json['section_name'];
    sectionnamear = json['section_name_ar'];
    sectionimage = json['section_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['section_id'] = sectionid;
    data['section_name'] = sectionname;
    data['section_name_ar'] = sectionnamear;
    data['section_image'] = sectionimage;
    return data;
  }
}
