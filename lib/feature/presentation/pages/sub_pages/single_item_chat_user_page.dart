import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingleItemChatUserPage extends StatelessWidget {
  final String? time;
  final String? recentSendMessage;
  final String? name;

  const SingleItemChatUserPage(
      {Key? key, this.time, this.recentSendMessage, this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, right: 10, left: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 55,
                    width: 55,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      child: Image.asset("assets/profile_default.png"),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        //"$name",
                        "User Name",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                       // "$recentSendMessage",
                        "Hey there! Iam Using Whatsapp",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ],
              ),
              //Text("$time")
              Text("12:20")
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 60, right: 10),
            child: Divider(
              thickness: 1.50,
            ),
          ),
        ],
      ),
    );
  }
}