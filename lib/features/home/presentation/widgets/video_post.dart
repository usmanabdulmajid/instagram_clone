import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../../../../core/utils/constants.dart';

class VideoPost extends StatefulWidget {
  const VideoPost({Key key}) : super(key: key);

  @override
  _VideoPostState createState() => _VideoPostState();
}

class _VideoPostState extends State<VideoPost> with TickerProviderStateMixin {
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;
  bool _isItv = false;
  bool _isWatchTv = false;
  bool _showWatchTvText = true;
  bool _isDurationVisible = true;
  bool _hasSound = true;
  bool _disabledSound = false;
  bool _soundIndicatorVisible = false;
  String _duration = "";

  @override
  void initState() {
    _controller = VideoPlayerController.asset("assets/video/vidTest.mp4",
        videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true));
    _initializeVideoPlayerFuture = _controller.initialize()
      ..then(
        (_) => setState(() {}),
      );
    _initializeVideoPlayerFuture.whenComplete(() => null);
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
          if (_controller.value.duration > Duration(seconds: 30)) {
            setState(() {
              _isWatchTv = true;
            });

            Future.delayed(Duration(seconds: 4), () {
              setState(() {
                _showWatchTvText = false;
              });
            });
          }
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
                setState(() {
                  if (_isItv) {
                    _isWatchTv = !_isWatchTv;
                    Future.delayed(Duration(seconds: 1), () {
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
                      Future.delayed(Duration(seconds: 4), () {
                        setState(() {
                          _showWatchTvText = false;
                        });
                      });
                    }
                  }
                  if (_hasSound) {
                    _disabledSound = !_disabledSound;
                    if (!_soundIndicatorVisible) {
                      _soundIndicatorVisible = !_soundIndicatorVisible;
                    }
                    if (_disabledSound) {
                      _controller.setVolume(1);
                    } else {
                      _controller.setVolume(0);
                    }
                    if (_soundIndicatorVisible) {
                      Future.delayed(Duration(seconds: 5), () {
                        setState(() {
                          _soundIndicatorVisible = false;
                        });
                      });
                    }
                  }
                  _controller.value.isPlaying
                      ? _controller.play()
                      : _controller.play();
                });
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
                    right: ksmallSpace / 2,
                    child: Visibility(
                      visible: _isDurationVisible,
                      child: Container(
                        width: 60,
                        color: Colors.transparent,
                        child: Center(
                          child: Text(
                            _duration,
                            style: TextStyle(
                              color: Color(0xFFF9F9F9),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
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
                            AnimatedSize(
                              duration: Duration(milliseconds: 300),
                              vsync: this,
                              curve: Curves.easeIn,
                              child: Container(
                                padding: EdgeInsets.only(right: 8.0),
                                width: _showWatchTvText ? null : 0,
                                child: Text(
                                  "Watch TV",
                                  maxLines: 1,
                                  overflow: TextOverflow.clip,
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: ksmallSpace,
                    right: ksmallSpace,
                    child: Visibility(
                      visible: _hasSound && _soundIndicatorVisible,
                      child: Container(
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(kmediumSpace),
                              right: Radius.circular(kmediumSpace)),
                        ),
                        child: Center(
                          child: Icon(
                            _disabledSound ? Icons.volume_up : Icons.volume_off,
                            color: Colors.white,
                            size: klmediumIconSize,
                          ),
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
