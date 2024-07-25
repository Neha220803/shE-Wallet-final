import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  List<ChatMessage> chatmsg = []; //to pass the message along with a parameter

  TextEditingController mssgCntlr =
      TextEditingController(); //for manipulating the input text

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFFFD9D9),
          foregroundColor: Color(0xFF002D56),
          leading: Container(
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[700],
              ),
              child: const Icon(
                Icons.person,
                size: 40,
              )),
          title: const Text("Nirvana Community"),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_vert, size: 30),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: chatmsg.length,
                itemBuilder: (context, index) {
                  if (chatmsg[index].isSender) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Flexible(
                            child: Container(
                              //width: 50,

                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              margin: EdgeInsets.only(right: 16),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.green[200]),
                              child: Text(
                                chatmsg[index].message,
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Container(
                              //width: 50,

                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              margin: EdgeInsets.only(right: 16),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.blue[200]),
                              child: Text(
                                chatmsg[index].message,
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                        controller: mssgCntlr,
                        decoration: InputDecoration(
                          hintText: "Type your message here...",
                          //suffixIcon: Icon(Icons.send),
                          border: OutlineInputBorder(),
                        )),
                  ),
                  IconButton(
                      onPressed: () {
                        String curmssg = mssgCntlr.text;

                        if (curmssg.isNotEmpty) {
                          setState(() {
                            chatmsg.add(ChatMessage(
                                message: curmssg,
                                isSender:
                                    true)); //stores the message with the parameter in the list
                            mssgCntlr.clear();
                          });
                        }
                      },
                      icon: Icon(
                        Icons.send,
                        size: 30,
                        color: Colors.green[600],
                      )),
                  IconButton(
                      onPressed: () {
                        String curmssg = mssgCntlr.text;
                        if (curmssg.isNotEmpty) {
                          setState(() {
                            chatmsg.add(ChatMessage(
                                message: curmssg,
                                isSender:
                                    false)); //stores the message with the parameter in the list
                            mssgCntlr.clear();
                          });
                        }
                      },
                      icon: Icon(
                        Icons.arrow_circle_down_sharp,
                        size: 35,
                        color: Colors.blue[600],
                      ))
                ],
              ),
            )
          ],
        ));
  }
}

class ChatMessage {
  String message;
  bool isSender;
  ChatMessage({required this.message, required this.isSender});
}
