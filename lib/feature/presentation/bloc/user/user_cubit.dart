import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/entities/user_entity.dart';
import '../../../domain/use_cases/create_one_to_one_chat_channel_usecase.dart';
import '../../../domain/use_cases/get_all_user_usecase.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final GetAllUserUseCase? getAllUserUseCase;
  final CreateOneToOneChatChannelUseCase? createOneToOneChatChannelUseCase;

  UserCubit({
    this.getAllUserUseCase,
    this.createOneToOneChatChannelUseCase,
  }) : super(UserInitial());

  Future<void> getAllUsers()async{
   try{
     final userStreamData=getAllUserUseCase!.call();
     userStreamData.listen((users) {
       emit(UserLoaded(users));
     });
   }on SocketException catch(_){
     emit(UserFailure());
   }catch(_){
     emit(UserFailure());
   }
  }
  Future<void> createChatChannel({String? uid,String? otherUid})async{
    try{
      await createOneToOneChatChannelUseCase!.call(uid!, otherUid!);
    }on SocketException catch(_){
      emit(UserFailure());
    }catch(_){
      emit(UserFailure());
    }
  }
}
