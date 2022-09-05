



import '../entities/contact_entity.dart';
import '../repositories/get_device_number_repository.dart';

class GetDeviceNumberUseCase{
  final GetDeviceNumberRepository? deviceNumberRepository;

  GetDeviceNumberUseCase({this.deviceNumberRepository});

  Future<List<ContactEntity>> call()async{
    return deviceNumberRepository!.getDeviceNumbers();
  }
}