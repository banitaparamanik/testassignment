




import 'package:testassignment/utils/network_manager.dart';

class ImageRepository {
  final NetworkManager networkManager;

  ImageRepository(this.networkManager);

  // Future<List<Map<String, dynamic>>> fetchCountryFromDb() async {
  //   try {
  //     List<Map<String, dynamic>> result =
  //         await dataBaseHelper.fetchAll(tableName: DataBaseHelper.countryTable);
  //     return result;
  //   } catch (_) {
  //     throw AppException(
  //         exceptionType: ExceptionType.databseError,
  //         message: "Error in fetach data from sqflite");
  //   }
  // }

  // Future<void> insertCountry(Map<String, dynamic> data) async {
  //   try {
  //     await dataBaseHelper.insertData(
  //         tableName: DataBaseHelper.countryTable, data: data);
  //   } catch (e) {
  //     throw AppException(
  //         exceptionType: ExceptionType.databseError,
  //         message: "Error in insert data into sqflite");
  //   }
  // }

  Future<dynamic> fetchImage() async {
    try {
      var response =
          await networkManager.get("https://jsonplaceholder.typicode.com/photos");
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
