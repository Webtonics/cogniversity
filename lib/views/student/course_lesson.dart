import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// import '../../Services/hyperlink/hyperlink_sevice.dart';
import '../../constants/spacing.dart';
// import '../../constants/theme/theme.dart';
// import '../../utils/elevated_buttons.dart';
// import '../../widget/video_card_list.dart';

class CourseLesson extends StatefulWidget {
  const CourseLesson({
    super.key, required this.videoSnap,
  });
  final AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> videoSnap;
  @override
  State<CourseLesson> createState() => _CourseLessonState();
}

class _CourseLessonState extends State<CourseLesson> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("video title"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                height: 250,
                width: double.infinity,
                decoration: const BoxDecoration(color: Colors.deepPurple),
                child: const Center(
                  child: Text("Video"),
                ),
              ),
      
              spacingH,
              const Center(
                child: Text(
                  "${"widget.snap[courseName]"} information",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ),
              spacingH,
              const Center(
                child: Text("${"widget.snap['description']"} "),
              ),
              spacingH,
              
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // LinkService().launchURL(widget.snap['groupChat'], context);
        },
        child: const Icon(Icons.chat),
      ),
    );
  }
}

// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';

// // In your build method


// class VideoPlayerWidget extends StatefulWidget {
//   final Reference videoRef;

//   const VideoPlayerWidget({Key? key, required this.videoRef}) : super(key: key);

//   @override
//   _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
// }

// class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
//   VideoPlayerController? _controller;
//   Future<void>? _initializeVideoPlayerFuture;
//   double _playbackSpeed = 1.0;

//   @override
//   void initState() {
//     super.initState();
//     _initializeVideoPlayerFuture = _initVideoPlayer();
//   }

//   @override
//   void dispose() {
//     _controller?.dispose();
//     super.dispose();
//   }

//   Future<void> _initVideoPlayer() async {
//     final url = await widget.videoRef.getDownloadURL();
//     _controller = VideoPlayerController.network(url);
//     await _controller!.initialize();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: _initializeVideoPlayerFuture,
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.done) {
//           return Scaffold(
//             body: AspectRatio(
//               aspectRatio: _controller!.value.aspectRatio,
//               child: Stack(
//                 alignment: Alignment.bottomCenter,
//                 children: <Widget>[
//                   VideoPlayer(_controller!),
//                   _buildControls(context),
//                 ],
//               ),
//             ),
//           );
//         } else {
//           return const Scaffold(
//             backgroundColor: Colors.white,
//             body: Center(child: CircularProgressIndicator(),),
//           );
//         }
//       },
//     );
//   }

//   Widget _buildControls(BuildContext context) {
//     return Container(
//       color: Colors.black.withOpacity(0.5),
//       child: Row(
//         children: <Widget>[
//           _buildPlayPauseButton(context),
//           _buildFastForwardButton(context),
//           _buildRewindButton(context),
//           _buildVolumeButton(context),
//           _buildSpeedButton(context),
//           _buildLoopButton(context),
//           Slider(
//             value: _controller!.value.position.inSeconds.toDouble(),
//             min: 0.0,
//             max: _controller!.value.duration.inSeconds.toDouble(),
//             onChanged: (value) => _controller!.seekTo(Duration(seconds: value.toInt())),
//           ),
//         ],
//       ),
//     );
//   }

//   // Implement functions for play/pause, rewind, fast forward, volume, speed, loop buttons
//   // (You can find implementations for these buttons online or in video_player documentation)

//   Widget _buildPlayPauseButton(BuildContext context) {
//   return IconButton(
//     icon: Icon(
//       _controller!.value.isPlaying ? Icons.pause : Icons.play_arrow,
//     ),
//     onPressed: () {
//       setState(() {
//         _controller!.value.isPlaying ? _controller!.pause() : _controller!.play();
//       });
//     },
//   );
//   }
//   Widget _buildFastForwardButton(BuildContext context) {
//   return IconButton(
//     icon: const Icon(Icons.forward_10),
//     onPressed: () {
//       final currentPosition = _controller!.value.position;
//       final newPosition = currentPosition + const Duration(seconds: 10);
//       _controller!.seekTo(newPosition > _controller!.value.duration
//           ? _controller!.value.duration
//           : newPosition);
//     },
//   );
// }

// Widget _buildRewindButton(BuildContext context) {
//   return IconButton(
//     icon: const Icon(Icons.replay_10),
//     onPressed: () {
//       final currentPosition = _controller!.value.position;
//       final newPosition = currentPosition - const Duration(seconds: 10);
//       _controller!.seekTo(newPosition < Duration.zero ? Duration.zero : newPosition);
//     },
//   );
// }

// Widget _buildVolumeButton(BuildContext context) {
//   return IconButton(
//     icon: Icon(_controller!.value.volume == 0 ? Icons.volume_off : Icons.volume_up),
//     onPressed: () {
//       setState(() {
//         _controller!.setVolume(_controller!.value.volume == 0 ? 1.0 : 0.0);
//       });
//     },
//   );
// }



// Widget _buildSpeedButton(BuildContext context) {
//   return PopupMenuButton<double>(
//     icon: const Icon(Icons.speed),
//     onSelected: (value) {
//       setState(() {
//         _playbackSpeed = value!;
//         _controller!.setPlaybackSpeed(value);
//       });
//     },
//     itemBuilder: (context) => [
//       const PopupMenuItem(
//         value: 0.5,
//         child: Text('0.5x'),
//       ),
//       const PopupMenuItem(
//         value: 1.0,
//         child: Text('Normal'),
//       ),
//       const PopupMenuItem(
//         value: 1.5,
//         child: Text('1.5x'),
//       ),
//     ],
//   );
// }

// bool _isLooping = false;

// Widget _buildLoopButton(BuildContext context) {
//   return IconButton(
//     icon: Icon(_isLooping ? Icons.repeat_one : Icons.repeat),
//     onPressed: () {
//       setState(() {
//         _isLooping = !_isLooping;
//         _controller!.setLooping(_isLooping);
//       });
//     },
//   );
// }

// }

