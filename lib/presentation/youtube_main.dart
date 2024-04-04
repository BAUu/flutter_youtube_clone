import 'package:flutter/material.dart';


void main() {
  runApp(YoutubeMain());
}

class YoutubeMain extends StatefulWidget {
  const YoutubeMain({super.key});

  @override
  State<YoutubeMain> createState() => _YoutubeMainState();
}

class _YoutubeMainState extends State<YoutubeMain> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
      appBar: AppBar(backgroundColor: Colors.black, title: Image.asset('assets/image/youtube_logo.png', height: 20,),
      actions: [
        IconButton(onPressed: onPressed, icon: Icon())
      ],),


    ));
  }
}
