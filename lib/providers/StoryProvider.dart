import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:rj_stories/models/StoryPageModel.dart';
import 'package:rj_stories/responses/StoryModel.dart';

class StroyProvider extends ChangeNotifier {
  List<StoryModel> _data = [];
  StoryPageModel _model = StoryPageModel();
  UnmodifiableListView<StoryModel> get items => UnmodifiableListView(_data);

  void fetchData() {
    print('start to fetch');
    _model.fetchData().then((value) {
      _data.addAll(value);
      notifyListeners();
    }).onError((error, stackTrace) {
      print('error in fetching data ${error.toString()}');
      notifyListeners();
    });
  }
}
