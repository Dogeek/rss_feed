import 'package:flutter/material.dart';
import '../widgets/feed_view.dart';
import '../models/rss_feed.dart';

class ViewFeedPage extends StatefulWidget {
  const ViewFeedPage({Key? key}) : super(key: key);

  @override
  State<ViewFeedPage> createState() => _ViewFeedPageState();
}

class _ViewFeedPageState extends State<ViewFeedPage> {
  @override
  Widget build(BuildContext context) {
    final feed = ModalRoute.of(context)!.settings.arguments as RssFeed;

    return Scaffold(
      appBar: AppBar(
        title: Text(feed.title),
      ),
      body: FeedView(feed: feed),
    );
  }
}
