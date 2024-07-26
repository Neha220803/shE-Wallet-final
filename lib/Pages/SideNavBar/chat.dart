import 'package:flutter/material.dart';
import 'package:sample/Data/Models/chat_mssg_model.dart';
import 'package:sample/Utils/constants.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  List<ChatMessage> chatmsg = [];
  TextEditingController mssgCntlr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: secondaryColor,
          foregroundColor: primaryColor,
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
              icon: const Icon(Icons.more_vert, size: 30),
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

                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              margin: const EdgeInsets.only(right: 16),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: green[200]),
                              child: Text(
                                chatmsg[index].message,
                                style: const TextStyle(fontSize: 18),
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
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              margin: const EdgeInsets.only(right: 16),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: blue[200]),
                              child: Text(
                                chatmsg[index].message,
                                style: const TextStyle(fontSize: 18),
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
              padding: const EdgeInsets.all(5),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                        controller: mssgCntlr,
                        decoration: const InputDecoration(
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
                        color: green[600],
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
                        color: blue[600],
                      ))
                ],
              ),
            )
          ],
        ));
  }
}
