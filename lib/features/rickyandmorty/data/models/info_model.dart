class InfoModel {
  final int count;
  final int pages;
  final String next;

  InfoModel(this.count, this.pages, this.next);

  factory InfoModel.fromJson(Map<String, dynamic> map) {
    return InfoModel(
      map['count'],
      map['pages'],
      map['next'],
    );
  }
}
