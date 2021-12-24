import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rj_stories/providers/StoryProvider.dart';
import 'package:rj_stories/responses/StoryModel.dart';
import 'package:video_player/video_player.dart';

class MainPageView extends StatefulWidget {
  const MainPageView({Key? key}) : super(key: key);

  @override
  _MainPageViewState createState() => _MainPageViewState();
}

class _MainPageViewState extends State<MainPageView> {
  StroyProvider _provider = StroyProvider();
  List<StoryModel> _list = [];
  late VideoPlayerController _controller;
  late PageController _pageController;
  int _currentIndex = 0;
  String title = '';
  @override
  Widget build(BuildContext context) {
    return MainPageView();
  }

  void _changePlayerState(int index) {
    setState(() {
      _controller.dispose();
      _currentIndex = index;
      if (_list.length > _currentIndex) {
        _controller =
            VideoPlayerController.network(_list[_currentIndex].hqLink!)
              ..initialize().then((_) {
                _controller.play();
                setState(() {});
              });
      }
      title = _list[_currentIndex].title!;
    });
  }

  PageView MyPageView() {
    return PageView.builder(
      physics: NeverScrollableScrollPhysics(),
      onPageChanged: (index) => _changePlayerState(index),
      itemCount: _list.length,
      itemBuilder: (_, index) {
        if (_controller.value.isInitialized) {
          return Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Center(
                child: AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller)),
              ),
              VideoProgressIndicator(_controller, allowScrubbing: true),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 70,
                      height: 70,
                      child: CircleAvatar(
                        backgroundImage:
                            NetworkImage(_list[_currentIndex].user!.thumbnail!),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.redAccent.withOpacity(.7),
                          borderRadius: BorderRadius.all(Radius.circular(8.0))),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          _list[_currentIndex].user!.displayName!,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              )
            ],
          );
        }
        return CupertinoActivityIndicator(
          color: Colors.red,
        );
      },
    );
  }
}
