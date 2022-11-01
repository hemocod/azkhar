class SectionDetailModel {
  // ignore: non_constant_identifier_names
  int? section_id;
  String? count;
  String? description;
  String? reference;
  String? content;

  SectionDetailModel(this.section_id, this.count, this.description,
      this.reference, this.content);

  SectionDetailModel.fromJson(Map<String, dynamic> json) {
    section_id = json['section_id'];
    count = json['count'];
    description = json['description'];
    reference = json['reference'];
    content = json['content'];
  }
}
