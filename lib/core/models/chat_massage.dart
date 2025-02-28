class ChatMassage{
  final String id;
  final String text;
  final DateTime createdAt;
  final String userId;
  final String userName;
  final String userImageURL;

  ChatMassage({
    required this.id, 
    required this.text, 
    required this.createdAt, 
    required this.userId, 
    required this.userName, 
    required this.userImageURL
  });


}