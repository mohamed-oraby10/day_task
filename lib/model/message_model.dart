class MessageModel {
  final String message;
  final String userId;
  MessageModel(this.message, this.userId);

  factory MessageModel.fromJson(jsonData) {
    return MessageModel(jsonData["text"],jsonData["senderId"]);
  }
}
