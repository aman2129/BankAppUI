import 'package:flutter/material.dart';

import '../screens/story_view.dart';

class StoryCircle extends StatelessWidget {
  final String imageUrl;
  final String label;
  const StoryCircle({super.key, required this.imageUrl, required this.label});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => StoryViewPage(imageUrl: imageUrl,)));
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.blueAccent, width: 2),
              ),
              child: CircleAvatar(
                radius: 30.0,
                backgroundImage:
                NetworkImage(imageUrl),
                backgroundColor: Colors.transparent,
              )
            ),
          ),
          Text(
            label,
            style: const TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }
}
