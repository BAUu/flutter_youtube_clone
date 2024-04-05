import 'package:flutter/material.dart';

void main() {
  runApp(YoutubeMain());
}

class YoutubeMain extends StatefulWidget {
  const YoutubeMain({Key? key}) : super(key: key);

  @override
  State<YoutubeMain> createState() => _YoutubeMainState();
}

class _YoutubeMainState extends State<YoutubeMain> {
  int _selectedIndex = 0;

  List<IconData> _icons = [
    Icons.home,
    Icons.explore,
    Icons.subscriptions,
    Icons.video_library,
  ];

  List<String> _titles = [
    'Home',
    'Explore',
    'Subscriptions',
    'Library',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Image.asset(
            'assets/image/youtube_logo1.png',
            height: 24,
          ),
          actions: [
            Icon(Icons.cast),
            SizedBox(width: 10),
            Icon(Icons.notifications_none),
            SizedBox(width: 10),
            Icon(Icons.search),
            SizedBox(width: 10),
            Icon(Icons.account_circle),
          ],
        ),
        body: _selectedIndex == 3 ? VideoList() : Center(child: Text('Selected Index: $_selectedIndex')), // Library 탭 선택 시 동영상 리스트를 표시

        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          backgroundColor: Colors.black,
          selectedItemColor: Colors.grey,
          unselectedItemColor: Colors.grey,
          items: List.generate(_icons.length, (index) {
            return BottomNavigationBarItem(
              icon: Icon(_icons[index]),
              label: _titles[index],
            );
          })..insert(
            2, // 가운데 위치
            BottomNavigationBarItem(
              icon: Icon(Icons.add_circle),
              label: '', // 아이콘 아래에 텍스트가 없도록 빈 문자열
            ),
          ),
        ),
      ),
    );
  }
}

class VideoList extends StatelessWidget {
  // 각 인덱스에 대한 동영상 이미지 경로 리스트
  final List<String> _videoThumbnails = [
    'assets/image/video_thumbnail_0.png',
    'assets/image/video_thumbnail_1.png',
    'assets/image/video_thumbnail_2.png',
    // 이하 생략
  ];

  // 각 인덱스에 대한 채널 프로필 이미지 경로 리스트
  final List<String> _channelProfileImages = [
    'assets/image/profile_0.png',
    'assets/image/profile_1.png',
    'assets/image/profile_2.png',
    // 이하 생략
  ];

  // 각 인덱스에 대한 동영상 제목 리스트
  final List<String> _videoTitles = [
    '썸네일 만들기',
    '쉽게 만드는 썸네일',
    '올해 우리나라 사람들의 best 픽',
    // 이하 생략
  ];

  // 각 인덱스에 대한 채널 이름 리스트
  final List<String> _channelNames = [
    'Channel Name 0',
    'Channel Name 1',
    'Channel Name 2',
    // 이하 생략
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10, // 표시할 동영상 수
      itemBuilder: (context, index) {
        return VideoListItem(
          title: _videoTitles[index % _videoTitles.length], // 인덱스에 대한 동영상 제목
          thumbnailUrl: _videoThumbnails[index % _videoThumbnails.length], // 인덱스에 대한 동영상 이미지 경로
          channelName: _channelNames[index % _channelNames.length], // 인덱스에 대한 채널 이름
          viewCount: '${(index + 1) * 100}K views',
          publishedTime: '$index days ago',
          profileImage: _channelProfileImages[index % _channelProfileImages.length], // 인덱스에 대한 채널 프로필 이미지 경로
        );
      },
    );
  }
}

class VideoListItem extends StatelessWidget {
  final String title;
  final String thumbnailUrl;
  final String channelName;
  final String viewCount;
  final String publishedTime;
  final String profileImage;

  const VideoListItem({
    required this.title,
    required this.thumbnailUrl,
    required this.channelName,
    required this.viewCount,
    required this.publishedTime,
    required this.profileImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            thumbnailUrl,
            height: 200,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 8.0),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4.0),
          Row(
            children: [
              CircleAvatar(
                radius: 12.0,
                backgroundImage: AssetImage(profileImage),
              ),
              const SizedBox(width: 4.0),
              Text(
                channelName,
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(width: 8.0),
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
