import 'package:flutter/material.dart';
import 'package:hls_video_player/userApi.dart';
import 'package:inview_notifier_list/inview_notifier_list.dart';

import 'chewie_list.dart';
import 'models/VideoModel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leadingWidth: 100,
            pinned: true,
            floating: false,
            leading: Padding(
              padding: EdgeInsets.only(left: 12.0),
              child: Image.asset('assets/images/yt_logo_dark.png'),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.cast),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.notifications_none),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.search),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.person),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Container(
              height: MediaQuery.of(context).size.height - 120,
              child: FutureBuilder<List<VideoModel>>(
                future: UserApi.getUserLocally(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final videos = snapshot.data!;
                    return InViewNotifierList(
                      physics: BouncingScrollPhysics(),
                      primary: false,
                      shrinkWrap: true,
                      itemCount: videos.length,
      
                      scrollDirection: Axis.vertical,
      
                      isInViewPortCondition: (double deltaTop,
                          double deltaBottom, double viewPortDimension) {
                        return deltaTop < (0.3 * viewPortDimension) &&
                            deltaBottom > (0.3 * viewPortDimension);
                      },
                      // itemCount: 10,
                      builder: (BuildContext context, int index) {
                        final video = videos[index];
      
                        return Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(vertical: 20.0),
                          child: LayoutBuilder(
                            builder: (BuildContext context,
                                BoxConstraints constraints) {
                              return InViewNotifierWidget(
                                id: '$index',
                                builder: (BuildContext context, bool isInView,
                                    Widget? child) {
                                  return VideoWidget(
                                      play: isInView, video: video);
                                },
                              );
                            },
                          ),
                        );
                      },
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
// else {
//                         final videos = snapshot.data!;

//                         return InViewNotifierList(
//                           // physics: BouncingScrollPhysics(),
//                           primary: false,
//                           shrinkWrap: true,
//                           itemCount: videos.length,

//                           scrollDirection: Axis.vertical,

//                           isInViewPortCondition: (double deltaTop,
//                               double deltaBottom, double viewPortDimension) {
//                             return deltaTop < (0.3 * viewPortDimension) &&
//                                 deltaBottom > (0.3 * viewPortDimension);
//                           },
//                           // itemCount: 10,
//                           builder: (BuildContext context, int index) {
//                             final video = videos[index];

//                             return Container(
//                               alignment: Alignment.center,
//                               margin: EdgeInsets.symmetric(vertical: 20.0),
//                               child: LayoutBuilder(
//                                 builder: (BuildContext context,
//                                     BoxConstraints constraints) {
//                                   return InViewNotifierWidget(
//                                     id: '$index',
//                                     builder: (BuildContext context,
//                                         bool isInView, Widget? child) {
//                                       return VideoWidget(
//                                           play: isInView, video: video);
//                                     },
//                                   );
//                                 },
//                               ),
//                             );
//                           },
//                         );
//                       }





  // SliverToBoxAdapter(
  //           child:
              
//                 Container(
//               height: MediaQuery.of(context).size.height,
//               child: FutureBuilder<List<VideoModel>>(
//                 future: UserApi.getUserLocally(),
//                 builder: (context, snapshot) {
//                   if(snapshot.hasData)
//                   {
//  final videos = snapshot.data!;
// return 

//  InViewNotifierList(
//                           // physics: BouncingScrollPhysics(),
//                           // primary: false,
//                           // shrinkWrap: true,
//                           itemCount: videos.length,

//                           scrollDirection: Axis.vertical,

//                           isInViewPortCondition: (double deltaTop,
//                               double deltaBottom, double viewPortDimension) {
//                             return deltaTop < (0.3 * viewPortDimension) &&
//                                 deltaBottom > (0.3 * viewPortDimension);
//                           },
//                           // itemCount: 10,
//                           builder: (BuildContext context, int index) {
//                             final video = videos[index];

//                             return Container(
//                               alignment: Alignment.center,
//                               margin: EdgeInsets.symmetric(vertical: 20.0),
//                               child: LayoutBuilder(
//                                 builder: (BuildContext context,
//                                     BoxConstraints constraints) {
//                                   return InViewNotifierWidget(
//                                     id: '$index',
//                                     builder: (BuildContext context,
//                                         bool isInView, Widget? child) {
//                                       return VideoWidget(
//                                           play: isInView, video: video);
//                                     },
//                                   );
//                                 },
//                               ),
//                             );
//                           },
//                         );
//                   }
//                   else{
//                     return CircularProgressIndicator();
//                   }
//                 },
//               ),
//             ),
//           ),