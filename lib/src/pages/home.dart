import 'package:flutter/material.dart';
import '../models/rss_feed.dart';
import '../widgets/feed_card.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xml/xml.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<RssFeed> _feeds = [];

  void _doReloadFeeds() async {
    final prefs = await SharedPreferences.getInstance();
    List<RssFeed> feeds = [];
    for (String feedUrl in prefs.getStringList('feeds') ?? []) {
      // Do the request
      var url = Uri.parse(feedUrl);
      var response = await http.get(url);
      // parse XML
      try {
        XmlDocument xml = XmlDocument.parse(response.body);
        for (XmlElement channel
            in xml.findElements('rss').first.childElements) {
          feeds.add(RssFeed.fromXml(channel));
        }
      } on XmlParserException catch (_) {}
      setState(() => _feeds = feeds);
    }
  }

  void _moveToNewFeedPage() {
    Navigator.pushNamed(context, "/add_feed");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: RefreshIndicator(
          onRefresh: () async => _doReloadFeeds(),
          child: ListView(
            children: _feeds.map((feed) => FeedCard(feed: feed)).toList(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _moveToNewFeedPage,
        tooltip: 'Add a feed',
        child: const Icon(Icons.add),
      ),
    );
  }
}
