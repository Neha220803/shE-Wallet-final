import 'dart:convert';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sample/Utils/constants.dart';

class ChatBot extends StatefulWidget {
  const ChatBot({super.key});

  @override
  State<ChatBot> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  ChatUser muself = ChatUser(id: "1", firstName: "neha");
  ChatUser bot = ChatUser(id: "2", firstName: "She-Help");
  List<ChatMessage> allMassages = [];
  List<ChatUser> typing = [];

  final ourUrl =
      "https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=AIzaSyAkkdj_GyFX2tG_81wJiLdLpZAGUNGA10U";
  final header = {'Content-Type': 'application/json'};

  getData(ChatMessage m) async {
    typing.add(bot);
    allMassages.insert(0, m);
    setState(() {});
    var data = {
      "contents": [
        {
          "parts": [
            {"text": m.text}
          ]
        }
      ]
    };

    await http
        .post(Uri.parse(ourUrl), headers: header, body: jsonEncode(data))
        .then((value) {
      if (value.statusCode == 200) {
        var result = jsonDecode(value.body);
        print(result["candidates"][0]["content"]["parts"][0]["text"]);
        ChatMessage m1 = ChatMessage(
          user: bot,
          createdAt: DateTime.now(),
          text: result["candidates"][0]["content"]["parts"][0]["text"],
        );
        allMassages.insert(0, m1);
      } else {
        print("Error occurred");
      }
    }).catchError((e) {});
    typing.remove(bot);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "She-Help",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: DashChat(
        inputOptions: const InputOptions(
            inputToolbarPadding:
                EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            inputToolbarStyle: BoxDecoration(color: primaryColor)),
        messageOptions: const MessageOptions(
            showTime: true,
            textColor: Colors.white,
            containerColor: Color.fromARGB(255, 229, 164, 164)),
        typingUsers: typing,
        currentUser: muself,
        onSend: (ChatMessage m) {
          getData(m);
        },
        messages: allMassages,
      ),
    );
  }
}
