import 'package:flutter/material.dart';
import 'package:whatsapp_clone/feature/presentation/pages/sub_pages/single_item_call_user_page.dart';

import '../widgets/theme/style.dart';


class CallPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return SingleItemCallPage();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        backgroundColor: primaryColor,
        child: Icon(Icons.add_call,color: Colors.white,),
      ),
    );
  }
}