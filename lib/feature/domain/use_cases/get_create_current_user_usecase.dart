

import '../entities/user_entity.dart';
import '../repositories/firebase_repository.dart';


class GetCreateCurrentUserUseCase{
  final FirebaseRepository? repository;

  GetCreateCurrentUserUseCase({this.repository});

  Future<void> call(UserEntity user)async{
    return await repository!.getCreateCurrentUser(user);
  }
}