import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rj_stories/providers/StoryProvider.dart';
import 'package:rj_stories/responses/StoryModel.dart';
import 'package:video_player/video_player.dart';

void main() {
  HttpOverrides.global = new MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Radio Javan Story',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'Radio Javan Story'),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  StroyProvider _provider = StroyProvider();
  List<StoryModel> _list = [];
  late VideoPlayerController _controller;
  late PageController _pageController;
  int _currentIndex = 0;
  String title = '';

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _provider.addListener(() {
      setState(() {
        _list = _provider.items;
        if (_list.length > _currentIndex) {
          _controller =
              VideoPlayerController.network(_list[_currentIndex].hqLink!)
                ..initialize().then((_) {
                  setState(() {});
                  _controller.play();
                });
        }
        _controller.addListener(() {
          if (_controller.value.position ==
              _controller
                  .value.duration) if (_currentIndex + 1 < _list.length) {
            _changePlayerState(_currentIndex + 1);
          }
        });
      });
    });
    _provider.fetchData();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
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

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: GestureDetector(
        onTapDown: (details) {
          if (_controller.value.isBuffering) return;
          if (details.globalPosition.dx < width / 3) {
            if (_currentIndex - 1 > 0) {
              _changePlayerState(_currentIndex - 1);
            }
            return;
          }
          if (details.globalPosition.dx > 2 * width / 3) {
            if (_currentIndex + 1 < _list.length) {
              _changePlayerState(_currentIndex + 1);
            }
            return;
          }
        },
        child: Center(
            child: _list.isEmpty
                ? CupertinoActivityIndicator()
                : PageView.builder(
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
                            VideoProgressIndicator(_controller,
                                allowScrubbing: true),
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
                                      backgroundImage: NetworkImage(
                                          _list[_currentIndex]
                                              .user!
                                              .thumbnail!),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.redAccent.withOpacity(.7),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8.0))),
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(
                                        _list[_currentIndex].user!.displayName!,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
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
                  )),
      ),
    );
  }
}
