class ChatThread {
  final String id;
  final String participantId;
  final String participantName;
  final String participantAvatar;
  final String lastMessage;
  final DateTime lastMessageTime;
  final int unreadCount;
  final bool isOnline;

  ChatThread({
    required this.id,
    required this.participantId,
    required this.participantName,
    required this.participantAvatar,
    required this.lastMessage,
    required this.lastMessageTime,
    this.unreadCount = 0,
    this.isOnline = false,
  });

  factory ChatThread.fromJson(Map<String, dynamic> json) {
    return ChatThread(
      id: json['id'],
      participantId: json['participantId'],
      participantName: json['participantName'],
      participantAvatar: json['participantAvatar'],
      lastMessage: json['lastMessage'],
      lastMessageTime: DateTime.parse(json['lastMessageTime']),
      unreadCount: json['unreadCount'] ?? 0,
      isOnline: json['isOnline'] ?? false,
    );
  }
} 