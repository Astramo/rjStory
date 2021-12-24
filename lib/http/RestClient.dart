import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:rj_stories/consts/ServerConsts.dart';
import 'package:rj_stories/responses/StoryModel.dart';
part 'RestClient.g.dart';

@RestApi(baseUrl: ServerConsts.BASE_URL)
abstract class RestClient {
  factory RestClient(Dio dio) = _RestClient;

  @GET('selfies_browse')
  Future<List<StoryModel>> getStories();
}
