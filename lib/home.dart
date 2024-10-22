import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:music_app/explore.dart';

class home extends StatelessWidget {
  const home({super.key});

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 70),

              const Text(
                "Tune",
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 40,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 10,
                ),
              ),
              const SizedBox(height: 30),

              LottieBuilder.asset(
                "assets/music3.json",
                repeat: true,
                reverse: true,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 30),

              const Padding(
                padding: EdgeInsets.only(right: 180),
                child: Text(
                  "Welcome!",
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 40,
                    
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),

              const Padding(
                    padding: EdgeInsets.only(right: 20),
                child: Text(
                  "Get ready to dive into\nthe world of music with Tune.",
                  style: TextStyle(
                    color: Color.fromARGB(255, 216, 213, 208),
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
                    const SizedBox(height: 60),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const explore()),
                  );
                },
                     icon: const Icon(
                  Icons.arrow_right,
                  color: Color.fromRGBO(251, 250, 250, 1),
                ),
                label: const Text(
                  "Get Started",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(248, 243, 243, 1),
                  ),
                ),
                    style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(
                    vertical: 12, horizontal: 100,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
