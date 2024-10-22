import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class music_details extends StatefulWidget {
  final Map<String, Object> music;
  const music_details({super.key, required this.music});

  @override
  State<music_details> createState() => _music_details();
}

class _music_details extends State<music_details> {
  double _currentSliderValue = 0;
  Duration totalDuration = const Duration(minutes: 4, seconds: 30);
  Duration currentPosition = const Duration(minutes: 0, seconds: 0);

  void _playPauseMusic() {
  }

  void _nextSong() {
  }

  void _previousSong() {
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 39, 26, 5),
              Color.fromARGB(255, 10, 10, 10),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 40),
                Center(
                  child: Text(
                    widget.music['Artist'] as String,
                    style: const TextStyle(
                      fontSize: 35,
                      color: Colors.orange,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 4,
                    ),
                  ),
                ),
                CircleAvatar(
                  radius: 150,
                  backgroundImage: AssetImage(widget.music['img'] as String),
                ),
                const SizedBox(height: 110),
          
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Text(widget.music['Name'] as String,
                      style: const TextStyle(
                            fontSize: 35,
                            color: Colors.orange,
                            fontWeight: FontWeight.w200,
                            letterSpacing: 4,
                          ),
                      ),
                    ),
                  ],
                ),
                 const SizedBox(height: 20),
          
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    children: [
                      Slider(
                        value: _currentSliderValue,
                        min: 0,
                        max: totalDuration.inSeconds.toDouble(),
                        onChanged: (double value) {
                          setState(() {
                            _currentSliderValue = value;
                            currentPosition = Duration(seconds: value.toInt());
                          });
                        },
                        activeColor: Colors.orange,
                        inactiveColor: Colors.grey,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _formatDuration(currentPosition),
                            style: const TextStyle(color: Colors.orange),
                          ),
                          Text(
                            _formatDuration(totalDuration),
                            style: const TextStyle(color: Colors.orange),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
          
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.skip_previous, color: Colors.orange),
                      iconSize: 50,
                      onPressed: _previousSong,
                    ),
                    IconButton(
                      icon: const Icon(Icons.play_arrow, color: Colors.orange),
                      iconSize: 70,
                      onPressed: _playPauseMusic,
                    ),
                    IconButton(
                      icon: const Icon(Icons.skip_next, color: Colors.orange),
                      iconSize: 50,
                      onPressed: _nextSong,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _formatDuration(Duration duration) {

    String twoDigits(int n) => n.toString().padLeft(2, '0');

    final minutes = twoDigits(duration.inMinutes.remainder(60));

    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return '$minutes:$seconds';
  }
}
