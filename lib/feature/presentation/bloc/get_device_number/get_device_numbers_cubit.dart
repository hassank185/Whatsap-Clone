

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/contact_entity.dart';
import '../../../domain/use_cases/get_device_numbers_usecase.dart';

part 'get_device_numbers_state.dart';

class GetDeviceNumbersCubit extends Cubit<GetDeviceNumbersState> {
  final GetDeviceNumberUseCase? getDeviceNumberUseCase;
  GetDeviceNumbersCubit({this.getDeviceNumberUseCase}) : super(GetDeviceNumbersInitial());

  Future<void> getDeviceNumbers()async{
    try{
      final contactNumbers=await getDeviceNumberUseCase!.call();
      emit(GetDeviceNumbersLoaded(contacts: contactNumbers));
    }catch(_){
      emit(GetDeviceNumbersFailure());
    }
  }
}
