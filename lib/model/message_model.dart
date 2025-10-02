

class MessageModel {
  final String message;

  MessageModel(this.message);

  factory MessageModel.fromJson(jsonData) {
    return MessageModel(jsonData["text"]);
  }
}
