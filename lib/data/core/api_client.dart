part of 'core.dart';

class ApiClient {
  final Dio _client;

  ApiClient(this._client);

  dynamic get(String path) async {
    final response = await _client.get(ApiConstants.baseUrl + path);

    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('Error');
    }
  }
}
