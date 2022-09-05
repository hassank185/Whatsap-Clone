


import '../entities/text_message_entity.dart';

import '../repositories/firebase_repository.dart';

class SendTextMessageUseCase{
  final FirebaseRepository? repository;

  SendTextMessageUseCase({this.repository});

  Future<void> sendTextMessage(TextMessageEntity textMessageEntity,String channelId)async{
    return await repository!.sendTextMessage(textMessageEntity,channelId);
  }

}