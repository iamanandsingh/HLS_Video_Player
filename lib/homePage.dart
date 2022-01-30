// import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:hls_video_player/userApi.dart';
import 'package:infinite_listview/infinite_listview.dart';
import 'package:inview_notifier_list/inview_notifier_list.dart';
import 'package:video_player/video_player.dart';
// import 'package:video_player/video_player.dart';

import 'chewie_list.dart';
import 'homeScreen.dart';
import 'models/VideoModel.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // List<VideoModel> videos = [];

  int selectedIndex = 0;
  static List<Widget> _pages = <Widget>[
    HomeScreen(),

    Center(
      child: Text('Shorts Page',
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    ),
    Center(
      child: Text('Add Page',
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    ),
    Center(
      child: Text('Subscription Page',
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    ),
    Center(
      child: Text('Library Page',
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  // @override
  // void initState() {
  //   super.initState();
  //   PaintingBinding.instance?.imageCache!.clear();

  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  actions: [
      //     Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Icon(Icons.cast),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Icon(Icons.notifications_none),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Icon(Icons.search),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Icon(Icons.person),
      //     ),
      //   ],
      body:
       IndexedStack(
        index: selectedIndex,
        children: _pages,
      ),
      //  Container(
      //   child: FutureBuilder<List<VideoModel>>(
      //     future: UserApi.getUserLocally(),
      //     builder: (context, snapshot) {
      //       switch (snapshot.connectionState) {
      //         case ConnectionState.waiting:
      //           return Center(
      //             child: CircularProgressIndicator(),
      //           );

      //         default:
      //           if (snapshot.hasError) {
      //             return Center(
      //               child: Text('Error Occured'),
      //             );
      //           } else {
      //       final videos = snapshot.data!;

      //             return buildVideos(videos);
      //           }
      //       }
      //     },
      //   ),
      // ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        showUnselectedLabels: true,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        iconSize: 20,
        onTap: _onItemTapped,
        elevation: 5,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
              ),
              activeIcon: Icon(
                Icons.home,
              ),
              label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.ondemand_video_outlined,
            ),
            label: "Shorts",
            activeIcon: Icon(
              Icons.ondemand_video,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_circle_outline,
              size: 35,
            ),
            label: '',
            activeIcon: Icon(
              Icons.add_circle_outlined,
              size: 35,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.subscriptions_outlined,
            ),
            label: 'Subscriptions',
            activeIcon: Icon(
              Icons.subscriptions,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.library_add_outlined,
            ),
            activeIcon: Icon(
              Icons.library_add,
            ),
            label: 'Library',
          ),
        ],
      ),
    );
  }
  // @override
  // void dispose() {

  //   // IMPORTANT to dispose of all the used resources
  //   super.dispose();
  //   widget.videoPlayerController.dispose();
  //   _chewieController.dispose();
  // }
}

// Widget buildVideos(List<VideoModel> videos) {
//   return InViewNotifierList(
//     physics: BouncingScrollPhysics(),

//     itemCount: videos.length,

//     scrollDirection: Axis.vertical,

//     isInViewPortCondition:
//         (double deltaTop, double deltaBottom, double viewPortDimension) {
//       return deltaTop < (0.3 * viewPortDimension) &&
//           deltaBottom > (0.3 * viewPortDimension);
//     },
//     // itemCount: 10,
//     builder: (BuildContext context, int index) {
//       final video = videos[index];

//       return Container(
//         alignment: Alignment.center,
//         margin: EdgeInsets.symmetric(vertical: 20.0),
//         child: LayoutBuilder(
//           builder: (BuildContext context, BoxConstraints constraints) {
//             return InViewNotifierWidget(
//               id: '$index',
//               builder: (BuildContext context, bool isInView, Widget? child) {
//                 return VideoWidget(play: isInView, video: video);
//               },
//             );
//           },
//         ),
//       );
//     },
//   );
// }
