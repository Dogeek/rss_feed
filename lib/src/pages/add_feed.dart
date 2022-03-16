import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddFeedPage extends StatefulWidget {
  const AddFeedPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<AddFeedPage> createState() => _AddFeedPageState();
}

class _AddFeedPageState extends State<AddFeedPage> {
  String _feedUrl = '';

  void _doAddFeed() async {
    // fetch the persisted preferences
    final prefs = await SharedPreferences.getInstance();
    // get the list of feeds
    List<String>? feeds = prefs.getStringList('feeds');
    feeds = feeds ?? [];

    // add the new RSS feed to the list
    feeds.add(_feedUrl);

    // Save the state
    prefs.setStringList('feeds', feeds);
    // Return to homepage
    Navigator.pop(context);
  }

  void _onURLInput(String text) {
    setState(() => _feedUrl = text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'URL to the RSS feed'),
              autofocus: true,
              onChanged: (text) => _onURLInput(text),
              onEditingComplete: () async => _doAddFeed(),
            ),
            TextButton(
              onPressed: () async => _doAddFeed(),
              child: const Text('Add feed'),
            ),
          ],
        ),
      ),
    );
  }
}
