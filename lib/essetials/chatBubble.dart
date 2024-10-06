import 'package:flutter/material.dart';
class Chat_Bubble extends StatelessWidget {

  final String message;
  final bool isCurrentUser;
  const Chat_Bubble({
    super.key,
    required this.message,
    required this.isCurrentUser,
  });

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
