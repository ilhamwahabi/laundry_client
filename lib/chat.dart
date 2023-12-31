import 'package:flutter/material.dart';

import 'dart:convert';
import 'dart:math';

import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';

// For the testing purposes, you should probably use https://pub.dev/packages/uuid.
String randomString() {
  final random = Random.secure();
  final values = List<int>.generate(16, (i) => random.nextInt(255));
  return base64UrlEncode(values);
}

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final List<types.Message> _messages = [];
  final _user = const types.User(id: '82091008-a484-4a89-ae75-a22bf8d6f3ac');
  final _admin = const types.User(id: '82091008-a484-4a89-ae75-a22bf8d6f3ad');

  @override
  void initState() {
    super.initState();
    _addMessage(types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: randomString(),
      text: "*Komplain 123* telah diajukan",
    ));

    _addMessage(types.TextMessage(
      author: _admin,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: randomString(),
      text: "Komplain Anda sedang diproses, mohon untuk menunggu hasilnya",
    ));

    _addMessage(types.TextMessage(
      author: _admin,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: randomString(),
      text:
          "Berdasarkan hasil penelusuran ditemukan bahwa cucian yang dimaksud benar tertinggal di outlet, kami akan menjadwalkan untuk mengembalikan cucian tersebut ke tempat Anda. Mohon maaf untuk ketidaknyamanannya.",
    ));

    _addMessage(types.TextMessage(
      author: _admin,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: randomString(),
      text: "*Komplain A123* telah diselesaikan",
    ));
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Layanan Pengguna'),
        ),
        body: Chat(
          messages: _messages,
          onSendPressed: _handleSendPressed,
          user: _user,
          theme: const DefaultChatTheme(
            inputBackgroundColor: Color(0xFF3282B8),
            primaryColor: Color(0xFF3282B8),
          ),
        ),
      );

  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }

  void _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: randomString(),
      text: message.text,
    );

    _addMessage(textMessage);
  }
}
