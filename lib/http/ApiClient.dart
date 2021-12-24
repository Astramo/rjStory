import 'package:rj_stories/http/RestClient.dart';
import 'package:dio/dio.dart';

class ApiClient {
  static RestClient? _api;

  static RestClient get instance {
    if (_api == null) _api = RestClient(Dio());

    return _api!;
  }
}
