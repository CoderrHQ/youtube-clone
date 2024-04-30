// ignore_for_file: public_member_api_docs, sort_constructors_first
class ShortVideoModel {
  final String caption;
  final String userId;
  final String shortVideo;
  final DateTime datePublished;
  ShortVideoModel({
    required this.caption,
    required this.userId,
    required this.shortVideo,
    required this.datePublished,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'caption': caption,
      'userId': userId,
      'shortVideo': shortVideo,
      'datePublished': datePublished.millisecondsSinceEpoch,
    };
  }

  factory ShortVideoModel.fromMap(Map<String, dynamic> map) {
    return ShortVideoModel(
      caption: map['caption'] as String,
      userId: map['userId'] as String,
      shortVideo: map['shortVideo'] as String,
      datePublished:
          DateTime.fromMillisecondsSinceEpoch(map['datePublished'] as int),
    );
  }
}
