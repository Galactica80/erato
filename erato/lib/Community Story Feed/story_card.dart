import 'package:flutter/material.dart';

class StoryCard extends StatefulWidget {
  const StoryCard({super.key});

  @override
  State<StoryCard> createState() => _StoryCardState();
}

class _StoryCardState extends State<StoryCard> {
  
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset('assets/images/image.png'), // Replace with your image path
        title: const Text('Title'),
        subtitle: const Text('Text'),
      ),
    );
  }
}