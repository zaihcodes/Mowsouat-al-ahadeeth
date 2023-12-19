class CategoryHadeeth {
  String id;
  String title;
  List<String> translations;

  CategoryHadeeth(
      {required this.id, required this.title, required this.translations});

  factory CategoryHadeeth.fromJson(Map<String, dynamic> json) {
    return CategoryHadeeth(
      id: json['id'],
      title: json['title'],
      translations: (json['translations'] as List)
          .map((item) => item.toString())
          .toList(),
    );
  }
}
