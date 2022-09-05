import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/use_cases/get_current_uid_usecase.dart';
import '../../../domain/use_cases/is_sign_in_usecase.dart';
import '../../../domain/use_cases/sign_out_usecase.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final IsSignInUseCase? isSignInUseCase;
  final GetCurrentUidUseCase? getCurrentUidUseCase;
  final SignOutUseCase? signOutUseCase;

  AuthCubit({
     this.isSignInUseCase,
     this.signOutUseCase,
     this.getCurrentUidUseCase,
  }) : super(AuthInitial());

  Future<void> appStarted() async{
    try{
      bool isSignIn= await isSignInUseCase!.call();

      if (isSignIn){
        final uid=await getCurrentUidUseCase!.call();
        emit(Authenticated(uid: uid));
      }else
        emit(UnAuthenticated());

    }catch(_){
      emit(UnAuthenticated());
    }
  }
  Future<void> loggedIn() async{
    try{
      final uid= await getCurrentUidUseCase!.call();
      emit(Authenticated(uid: uid));
    }catch(_){

    }
  }
  Future<void> loggedOut() async{
    try{
      await signOutUseCase!.call();
      emit(UnAuthenticated());
    }catch(_){}

  }
}
