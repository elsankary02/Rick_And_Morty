import 'package:dio/dio.dart';

class ApiService {
  late Dio dio;
  final paseUrl = 'https://rickandmortyapi.com/api/';

  Future<Map<String, dynamic>> getApi({required String endPoint}) async {
    Response response = await dio.get('$paseUrl$endPoint');
    return response.data;
  }
}
