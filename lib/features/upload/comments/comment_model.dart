// ignore_for_file: public_member_api_docs, sort_constructors_first
class CommentModel {
  final String commentText;
  final String videoId;
  final String commmentId;
  final String displayName;
  final String profilePic;
  CommentModel({
    required this.commentText,
    required this.videoId,
    required this.commmentId,
    required this.displayName,
    required this.profilePic,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'commentText': commentText,
      'videoId': videoId,
      'commmentId': commmentId,
      'displayName': displayName,
      'profilePic': profilePic,
    };
  }

  factory CommentModel.fromMap(Map<String, dynamic> map) {
    return CommentModel(
      commentText: map['commentText'] as String,
      videoId: map['videoId'] as String,
      commmentId: map['commmentId'] as String,
      displayName: map['displayName'] as String,
      profilePic: map['profilePic'] as String,
    );
  }
}
