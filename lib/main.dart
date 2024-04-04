import 'package:flutter/material.dart';

void main() {
  runApp(YoutubeApp());
}

class YoutubeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Image.asset(
            'assets/images/youtube_logo.png', // 유튜브 로고 이미지
            height: 30,
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.search,
                color: Colors.black,
              ),
              onPressed: () {
                // 검색 기능 구현
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.account_circle,
                color: Colors.black,
              ),
              onPressed: () {
                // 계정 관련 기능 구현
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // 비디오 목록 위젯
              VideoListWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class VideoListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 10, // 보여줄 비디오 수
      itemBuilder: (context, index) {
        return VideoListItemWidget(
          // 각 비디오 아이템에 대한 정보 전달
          videoTitle: 'Video Title $index',
          videoThumbnail: 'assets/images/video_thumbnail_$index.png', // 비디오 썸네일 이미지
          channelName: 'Channel Name $index',
          viewCount: '1M views',
          publishedTime: '2 weeks ago',
        );
      },
    );
  }
}

class VideoListItemWidget extends StatelessWidget {
  final String videoTitle;
  final String videoThumbnail;
  final String channelName;
  final String viewCount;
  final String publishedTime;

  VideoListItemWidget({
    required this.videoTitle,
    required this.videoThumbnail,
    required this.channelName,
    required this.viewCount,
    required this.publishedTime,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            videoThumbnail,
            height: 200,
            width: MediaQuery.of(context).size.width, // 화면 폭에 맞게 이미지 크기 조절
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 8.0),
          Text(
            videoTitle,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4.0),
          Text(
            channelName,
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 4.0),
          Row(
            children: [
              Icon(Icons.remove_red_eye, size: 16.0, color: Colors.grey[600]),
              const SizedBox(width: 4.0),
              Text(
                viewCount,
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(width: 8.0),
              Text(
                publishedTime,
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
