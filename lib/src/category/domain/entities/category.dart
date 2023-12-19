class Category {
  String id;
  String title;
  String hadeethsCount;
  String? parentId;

  Category({
    required this.id,
    required this.title,
    required this.hadeethsCount,
    this.parentId,
  });
}
