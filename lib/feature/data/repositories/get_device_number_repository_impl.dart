

import '../../domain/entities/contact_entity.dart';
import '../../domain/repositories/get_device_number_repository.dart';
import '../local_datasource/local_datasource.dart';

class GetDeviceNumberRepositoryImpl implements GetDeviceNumberRepository{
  final LocalDataSource? localDataSource;

  GetDeviceNumberRepositoryImpl({this.localDataSource});
  @override
  Future<List<ContactEntity>> getDeviceNumbers() {
    return localDataSource!.getDeviceNumbers();
  }

}