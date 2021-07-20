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
  FocusNode _focusNode;

  @override
  void initState() {
    _focusNode = FocusNode();
    _controller = VideoPlayerController.asset("assets/video/vidTest.mp4",
        videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true));
    _initializeVideoPlayerFuture = _controller.initialize()
      ..then(
        (_) => setState(() {}),
      );
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
                _controller.value.isPlaying
                    ? _controller.pause()
                    : _controller.play();
              },
              child: AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              ),
            )
          : Container(
              color: Colors.white,
            ),
    );
  }
}
