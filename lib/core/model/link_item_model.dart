class LinkItemModel {
  String? originalLink;
  String? shortLink;

  LinkItemModel({this.originalLink, this.shortLink});

  factory LinkItemModel.fromJson(Map<String, dynamic> json) {
    return LinkItemModel(originalLink: json['original_link'] ?? '', shortLink: json['full_short_link'] ?? '');
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['original_link'] = originalLink;
    data['full_short_link'] = shortLink;
    return data;
  }
}
