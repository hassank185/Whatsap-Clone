import 'package:flutter/material.dart';
import 'package:whatsapp_clone/feature/presentation/pages/sub_pages/single_item_chat_user_page.dart';
import 'package:whatsapp_clone/feature/presentation/widgets/theme/style.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              color: greenColor.withOpacity(.5),
              borderRadius: BorderRadius.all(Radius.circular(100)),
            ),
            child: Icon(
              Icons.message,
              color: Colors.white.withOpacity(.6),
              size: 40,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                "Start chat with your friend's and family, \n on Whatsapp Clone",
                style: TextStyle(fontSize: 14,color: Colors.black.withOpacity(.4)),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: () {},
        child: Icon(Icons.chat),
      ),
    );
  }

  Widget _myChatList() {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (_, index) {
          return SingleItemChatUserPage();
        },
      ),
    );
  }
}
