class NoteEntity {
  String? id;
  final String userId;
  final String title;
  final String content;
  final DateTime createdAt;
  final int colorId;

  NoteEntity({
    this.id,
    required this.userId,
    required this.title,
    required this.content,
    required this.createdAt,
    required this.colorId,
  });

  factory NoteEntity.fromJson(Map<String, dynamic> json) {
    return NoteEntity(
      userId: json["user_id"],
      title: json["title"],
      content: json["content"],
      createdAt: DateTime.parse(
        json["created_at"],
      ),
      colorId: json["color_id"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "content": content,
      "created_at": createdAt.toIso8601String(),
      "color": colorId,
    };
  }
}
