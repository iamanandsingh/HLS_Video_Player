import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoWidget extends StatefulWidget {
  final video;
  final bool play;

  const VideoWidget({Key? key, required this.video, required this.play})
      : super(key: key);
  @override
  _VideoWidgetState createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.video.videoUrl);
    _initializeVideoPlayerFuture = _controller.initialize().then((_) {
      // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
      setState(() {});
    }).onError(
      (error, stackTrace) => null,
    );

    if (widget.play ) {
      _controller.play();
      _controller.setLooping(true);
    }
  }

  @override
  void didUpdateWidget(VideoWidget oldWidget) {
    if (oldWidget.play != widget.play) {
      if (widget.play) {
        _controller.play();
        _controller.setLooping(true);
      } else {
        _controller.pause();
      }
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Center(
            child: Card(
              child: Column(
                children: [
                  AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: widget.play == true
                          ? VideoPlayer(_controller)
                          : Image.network(widget.video.coverPicture)),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.video.title,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return SizedBox(
            height: MediaQuery.of(context).size.height / 3,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}


    // chewieController = ChewieController(
    //   videoPlayerController: widget.videoPlayerController,
    //   aspectRatio: 16 / 9,
    //   autoPlay: false,
    //   errorBuilder: (context, errorMessage) {
    //     return Center(
    //       child: Text(
    //         errorMessage,
    //         style: TextStyle(color: Colors.white),
    //       ),
    //     );
    //   },
    // );