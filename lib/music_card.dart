import "package:flutter/material.dart";

class music_card extends StatelessWidget {
  final String name;
  final String artist;
  final String image;
  const music_card({super.key, required this.name, required this.artist,required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(8.0), 
        decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(50),
          border: Border.all(color: Colors.orange, width: 2)
        ),
        child: Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween, 
          children: [
           
             CircleAvatar(
              radius: 30, 
              backgroundImage: AssetImage(
                  image), 
            ),
      
            // Artist Name
             Padding(
              padding: const EdgeInsets.only(
                  left: 16.0), // Add some padding between image and text
              child: Text(
                '$name-$artist'  , // Replace with actual artist name
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Set your preferred text color
                ),
              ),
            ),
      
            // Play Button
            IconButton(
              icon: const Icon(Icons.play_arrow),
              color: Colors.white, // Set the color of the play icon
              iconSize: 30, // Set the size of the play icon
              onPressed: () {
                // Define the action for the play button here
              },
            ),
          ],
        ),
      ),
    );
  }
}
