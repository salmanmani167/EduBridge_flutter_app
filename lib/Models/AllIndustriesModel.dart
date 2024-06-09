class AllIndustries {
  final int id;
  final String author;
  final String title;
  final String description;
  final int status;
  final String image;
  final String createdAt;
  final String updatedAt;

  AllIndustries({
    required this.id,
    required this.author,
    required this.title,
    required this.description,
    required this.status,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  factory AllIndustries.fromJson(Map<String, dynamic> json) {
    return AllIndustries(
      id: json['id'] as int,
      author: json['author'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      status: json['status'] as int,
      image: json['image'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );
  }
}
