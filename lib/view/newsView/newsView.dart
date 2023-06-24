import 'package:flutter/material.dart';

class NewsfeedView extends StatefulWidget {
  const NewsfeedView({super.key});

  @override
  State<NewsfeedView> createState() => _NewsfeedViewState();
}

class _NewsfeedViewState extends State<NewsfeedView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Feed'),
      ),
      body: const Center(
        child: Text('News Feed'),
      ),
    );
  }
}
