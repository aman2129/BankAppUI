import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';

class StoryViewPage extends StatefulWidget {

  final String imageUrl;
  const StoryViewPage({super.key, required this.imageUrl});

  @override
  State<StoryViewPage> createState() => _StoryViewPageState();
}

class _StoryViewPageState extends State<StoryViewPage> {
  final controller = StoryController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey,
        body: Stack(
          children: [
            StoryView(
              storyItems: [
                StoryItem.text(
                    title: 'Hello world', backgroundColor: Colors.grey),
                StoryItem.pageImage(
                    url:
                        widget.imageUrl,
                    controller: controller,
                    imageFit: BoxFit.fitHeight)
              ],
              indicatorForegroundColor: Colors.blueAccent,
              controller: controller,
              onComplete: () {
                Navigator.pop(context);
              },
              inline: false,
              repeat: false,
            ),
            Positioned(
              right: 10,
              top: 20,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.cancel_outlined,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
