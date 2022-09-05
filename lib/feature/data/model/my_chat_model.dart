import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_platform_interface/src/timestamp.dart';

import '../../domain/entities/my_chat_entity.dart';

class MyChatModel extends MyChatEntity {
  MyChatModel({
    String? senderName,
    String? senderUID,
    String? recipientName,
    String? recipientUID,
    String? channelId,
    String? profileURL,
    String? recipientPhoneNumber,
    String? senderPhoneNumber,
    String? recentTextMessage,
    bool? isRead,
    bool? isArchived,
    Timestamp? time,
  }) : super(
          senderName: senderName!,
          senderUID: senderUID!,
          recipientName: recipientName!,
          recipientUID: recipientUID!,
          channelId: channelId!,
          profileURL: profileURL!,
          recipientPhoneNumber: recipientPhoneNumber!,
          senderPhoneNumber: senderPhoneNumber!,
          recentTextMessage: recentTextMessage!,
          isRead: isRead!,
          isArchived: isArchived!,
          time: time!,
        );

  factory MyChatModel.fromSnapShot(DocumentSnapshot snapshot) {
    return MyChatModel(
      senderName: snapshot.get('senderName'),
      senderUID: snapshot.get('senderUID'),
      senderPhoneNumber: snapshot.get('senderPhoneNumber'),
      recipientName: snapshot.get('recipientName'),
      recipientUID: snapshot.get('recipientUID'),
      recipientPhoneNumber: snapshot.get('recipientPhoneNumber'),
      channelId: snapshot.get('channelId'),
      time: snapshot.get('time'),
      isArchived: snapshot.get('isArchived'),
      isRead: snapshot.get('isRead'),
      recentTextMessage: snapshot.get('recentTextMessage'),
      profileURL: snapshot.get('profileURL')
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      "senderName": senderName,
      "senderUID": senderUID,
      "recipientName": recipientName,
      "recipientUID": recipientUID,
      "channelId": channelId,
      "profileURL": profileURL,
      "recipientPhoneNumber": recipientPhoneNumber,
      "senderPhoneNumber": senderPhoneNumber,
      "recentTextMessage": recentTextMessage,
      "isRead": isRead,
      "isArchived": isArchived,
      "time": time,
    };
  }
}
