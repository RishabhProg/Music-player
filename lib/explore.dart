import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:music_app/list.dart';
import 'package:music_app/music_card.dart';
import 'package:music_app/music_details.dart';

class explore extends StatefulWidget {
  const explore({super.key});

  @override
  State<explore> createState() => _explore();
}

class _explore extends State<explore> {
  final List<String> ad = const [
    'assets/guitar.json',
    'assets/record.json',
    'assets/waves.json'
  ];
  final List<String> cardText = const [
    'Top\nArtists',
    'Top\nrecord',
    'New\nreleases'
  ];

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
        child: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: TextField(
                        style: TextStyle(
                            color: Color.fromRGBO(220, 217, 217, 1)),
                        decoration: InputDecoration(
                          hintText: "Search by name, type, etc...",
                          prefixIcon: Icon(Icons.search),
                          prefixIconColor: Color.fromRGBO(220, 217, 217, 1),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(255, 255, 255, 1)),
                            borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(40),
                              right: Radius.circular(40),
                            ),
                          ),
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Color.fromRGBO(220, 217, 217, 1),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 16.0),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundColor: Color.fromRGBO(30, 165, 43, 0),
                      radius: 50,
                      child: CircleAvatar(
                        child: Image.asset(
                          "assets/person.png",
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(
                height: 30,
              ),
              
              const Align(
                alignment: Alignment(-0.9, 0.0),
                child: Text(
                  "Today's Playlist !",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                    letterSpacing: 2,
                  ),
                ),
              ),
              
             
              SizedBox(
                height: 250, 
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: ad.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 0,
                      color: Color.fromRGBO(212, 74, 20, 0.5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 150,
                            width: 150,
                            child: LottieBuilder.asset(
                              ad[index],
                              repeat: true,
                              reverse: true,
                              fit: BoxFit.contain,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              cardText[index],
                              style: const TextStyle(
                                color: Colors.orange,
                                fontSize: 16,
                                letterSpacing: 4,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              
              Expanded(
                child: ListView.builder(
                  itemCount: music.length,
                  itemBuilder: (context, index) {
                    final ms = music[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  music_details(music: ms,)),
                  );
                      },
                      child: music_card(
                        name: ms['Name'] as String,
                        artist: ms['Artist'] as String,
                        image: ms['img'] as String,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
