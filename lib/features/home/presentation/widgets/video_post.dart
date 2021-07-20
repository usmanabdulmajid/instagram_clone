import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../../../../constants.dart';

class VideoPost extends StatefulWidget {
  const VideoPost({Key key}) : super(key: key);

  @override
  _VideoPostState createState() => _VideoPostState();
}

class _VideoPostState extends State<VideoPost> {
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;
  bool _isItv = false;
  bool _isWatchTv = false;
  bool _showWatchTvText = true;
  bool _isDurationVisible = true;
  String _duration = "";

  @override
  void initState() {
    _controller = VideoPlayerController.asset("assets/video/vidTest.mp4",
        videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true));
    _initializeVideoPlayerFuture = _controller.initialize()
      ..then(
        (_) => setState(() {}),
      );
    _controller.addListener(() {
      if (_controller.value.isInitialized && _controller.value.isPlaying) {
        if (!_isDurationVisible) {
          _isDurationVisible = true;
        }
        var d = _controller.value.duration;
        setState(() {
          _duration = (d.inMinutes - _controller.value.position.inMinutes)
                  .toString() +
              ":" +
              (d.inSeconds - _controller.value.position.inSeconds).toString();
        });
        if (_controller.value.position.inSeconds ==
            Duration(seconds: 30).inSeconds) {
          _controller.pause();
          setState(() {
            _isItv = true;
          });
          //TODO
          //Show Watch
        }
      }
    });
    _controller.play();
    _controller.setLooping(true);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _controller.value.isInitialized
          ? GestureDetector(
              onTap: () {
                if (_isItv) {
                  _isWatchTv = !_isWatchTv;
                  Future.delayed(Duration(seconds: 2), () {
                    setState(() {
                      _showWatchTvText = !_showWatchTvText;
                    });
                  });
                  if (_isWatchTv) {
                    Future.delayed(Duration(seconds: 5), () {
                      setState(() {
                        _isWatchTv = false;
                      });
                    });
                    Future.delayed(Duration(seconds: 3), () {
                      setState(() {
                        _showWatchTvText = false;
                      });
                    });
                  }
                }
                _controller.value.isPlaying
                    ? _controller.pause()
                    : _controller.play();
              },
              child: Stack(
                fit: StackFit.expand,
                children: [
                  AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  ),
                  Positioned(
                    top: ksmallSpace,
                    right: ksmallSpace,
                    child: Visibility(
                      visible: _isDurationVisible,
                      child: Container(
                        width: 60,
                        padding: EdgeInsets.all(ksmallSpace),
                        color: Colors.transparent,
                        child: Center(
                          child: Text(
                            _duration,
                            style: TextStyle(
                              color: Color(0xFFF9F9F9),
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: ksmallSpace,
                    bottom: ksmallSpace,
                    child: Visibility(
                      visible: _isItv && _isWatchTv,
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        padding: EdgeInsets.fromLTRB(8, 8, 0, 8),
                        decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(kmediumSpace),
                              right: Radius.circular(kmediumSpace)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.live_tv_rounded,
                              size: klmediumIconSize,
                            ),
                            SizedBox(
                              width: 8.0,
                            ),
                            AnimatedContainer(
                                duration: Duration(milliseconds: 200),
                                width: _showWatchTvText ? 80 : 0,
                                child: _showWatchTvText
                                    ? Text(
                                        "Watch TV",
                                        maxLines: 1,
                                        overflow: TextOverflow.clip,
                                      )
                                    : SizedBox())
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          : Container(
              color: Colors.white,
            ),
    );
  }
}
