import 'package:rj_stories/http/ApiClient.dart';
import 'package:rj_stories/http/RestClient.dart';

class BaseModel {
  RestClient getApi() {
    return ApiClient.instance;
  }
}
