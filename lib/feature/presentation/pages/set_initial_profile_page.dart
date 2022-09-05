import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone/feature/presentation/bloc/phone_auth/phone_auth_cubit.dart';
import 'package:whatsapp_clone/feature/presentation/screens/home_screen.dart';

import '../widgets/theme/style.dart';

class SetInitialProfilePage extends StatefulWidget {
  final String? phoneNumber;
  const SetInitialProfilePage({Key? key, this.phoneNumber}) : super(key: key);

  @override
  State<SetInitialProfilePage> createState() => _SetInitialProfilePageState();
}

class _SetInitialProfilePageState extends State<SetInitialProfilePage> {
  String get _phoneNumber => widget.phoneNumber!;
  TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          children: [
            Text(
              "Profile Info",
              style: TextStyle(
                color: greenColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Please provide your name and an optional Profile photo",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            _rowWidget(),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: MaterialButton(
                  color: greenColor,
                  onPressed: _submitProfileInfo,
                  child: Text(
                    "Next",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _rowWidget() {
    return Container(
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: textIconColorGray,
              borderRadius: BorderRadius.all(
                Radius.circular(25),
              ),
            ),
            child: Icon(Icons.camera_alt),
          ),
          SizedBox(
            width: 8,
          ),
          Expanded(
            child: TextField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: "Enter your name",
              ),
            ),
          ),
          SizedBox(width: 8.0),
          Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              color: textIconColorGray,
              borderRadius: BorderRadius.all(
                Radius.circular(25),
              ),
            ),
            child: Icon(Icons.insert_emoticon),
          ),
        ],
      ),
    );
  }

  void _submitProfileInfo(){
    if(_nameController.text.isNotEmpty){
      BlocProvider.of<PhoneAuthCubit>(context).submitProfileInfo(
        profileUrl: "",
        phoneNumber: _phoneNumber,
        name: _nameController.text,
      );
    }
  }
}
