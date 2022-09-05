import 'package:flutter/material.dart';
import 'package:whatsapp_clone/feature/presentation/pages/call_page.dart';
import 'package:whatsapp_clone/feature/presentation/pages/camera_page.dart';
import 'package:whatsapp_clone/feature/presentation/pages/chat_page.dart';
import 'package:whatsapp_clone/feature/presentation/pages/status_page.dart';

class HomeScreen extends StatefulWidget {
  final String? uid;
  const HomeScreen({Key? key, this.uid,}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>with SingleTickerProviderStateMixin {
 bool _isSearch = false;
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this, initialIndex: 1);
    super.initState();
  }
 _buildSearch() {
   return Container(
     height: 48,
     margin: EdgeInsets.only(top: 20),
     decoration: BoxDecoration(color: Colors.white, boxShadow: [
       BoxShadow(
           color: Colors.black.withOpacity(.1),
           spreadRadius: 1,
           offset: Offset(0.0, 0.20))
     ]),
     child: TextField(
       decoration: InputDecoration(
         hintText: "Search...",
         prefixIcon: InkWell(
           onTap: () {
             //TODO:
             setState(() {
               _isSearch = false;
             });
           },
           child: Icon(Icons.arrow_back),
         ),
       ),
     ),
   );
 }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0.0,
          backgroundColor: _isSearch==false? Color(0xFF075E54):Colors.white,
          title: _isSearch==false?Text("Whatsapp Clone"):Container(height: 0.0,width: 0.0,),
          flexibleSpace: _isSearch == false
              ? Container(
            height: 0.0,
            width: 0.0,
          )
              : _buildSearch(),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  _isSearch = true;
                });
              },
              icon: Icon(Icons.search),
            ),
            PopupMenuButton<String>(
              onSelected: (value) {
                print(value);
              },
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    child: Text("New group"),
                    value: "New group",
                  ),
                  PopupMenuItem(
                    child: Text("New broadcast"),
                    value: "New broadcast",
                  ),
                  PopupMenuItem(
                    child: Text("Whatsapp Web"),
                    value: "Whatsapp Web",
                  ),
                  PopupMenuItem(
                    child: Text("Starred messages"),
                    value: "Starred messages",
                  ),
                  PopupMenuItem(
                    child: Text("Settings"),
                    value: "Settings",
                  ),
                ];
              },
            )
          ],
          bottom: TabBar(
            controller: _tabController,
            tabs: [
              Tab(
                icon: Icon(Icons.camera_alt),
              ),
              Tab(
                text: "CHATS"
              ),
              Tab(
                  text: "STATUS"
              ),
              Tab(
                  text: "CALLS"
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            CameraPage(),
            ChatPage(),
            StatusPage(),
            CallPage()
          ],
        ),
      ),
    );
  }
}
