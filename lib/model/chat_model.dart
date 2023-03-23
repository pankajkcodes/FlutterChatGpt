enum ChatMessageType { user, bot }

class ChatMessageModel {
  ChatMessageModel({
    required this.text,
    required this.chatMessageType,
  });

  final String text;
  final ChatMessageType chatMessageType;
}