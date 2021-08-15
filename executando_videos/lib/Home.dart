import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    VideoPlayerController.network(
        "https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4"
    )..initialize().then((dados) {
      setState(() {

      });
    });
    //VideoPlayerController.file(file)
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
