import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
     String? name,
     String? email,
     String? phoneNumber,
     bool? isOnline,
     String? uid,
     String? status,
     String? profileUrl,
  }) : super(
    name: name,
    email: email,
    phoneNumber: phoneNumber,
    isOnline: isOnline,
    uid: uid,
    status: status,
    profileUrl: profileUrl,
  );

  factory UserModel.fromJson(Map<String,dynamic> json){
    return UserModel(
      name: json['name'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      isOnline: json['isOnline'],
      uid: json['uid'],
        status: json['status'],
        profileUrl: json['profileUrl']
    );
  }

  factory UserModel.fromSnapshot(DocumentSnapshot snapshot) {
   // var snapshot = snapshot.data() as Map<String, dynamic>;
    return UserModel(
      name: snapshot.get('name'),
      email: snapshot.get('email'),
      phoneNumber: snapshot.get('phoneNumber'),
      uid: snapshot.get('uid'),
      isOnline: snapshot.get('isOnline'),
      profileUrl: snapshot.get('profileUrl'),
      status: snapshot.get('status'),
    );

  }

  Map<String, dynamic> toDocument() {
    return {
      "name": name,
      "email": email,
      "phoneNumber": phoneNumber,
      "uid": uid,
      "isOnline": isOnline,
      "profileUrl": profileUrl,
      "status": status,
    };
  }
}
