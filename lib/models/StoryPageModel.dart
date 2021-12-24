import 'package:rj_stories/models/BaseModel.dart';
import 'package:rj_stories/responses/StoryModel.dart';

class StoryPageModel extends BaseModel {
  Future<List<StoryModel>> fetchData() {
    return getApi().getStories();
  }
}
