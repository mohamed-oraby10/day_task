class MessageModel {
  final String message;
  final String userId;
  final bool isSeen;
  MessageModel(this.message, this.userId, this.isSeen);

  factory MessageModel.fromJson(jsonData) {
    return MessageModel(
      jsonData["text"],
      jsonData["senderId"],
      jsonData["isSeen"],
    );
  }
}
