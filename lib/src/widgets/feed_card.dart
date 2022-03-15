import 'package:flutter/material.dart';
import '../models/rss_feed.dart';

class FeedCard extends StatelessWidget {
  const FeedCard({Key? key, required RssFeed feed})
      : _feed = feed,
        super(key: key);

  final RssFeed _feed;

  void _moveToFeedPage(BuildContext context) {
    Navigator.pushNamed(context, '/view_feed', arguments:_feed);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        child: ListTile(
          leading: const Icon(Icons.abc_sharp),
          title: Text(_feed.title),
          subtitle: Text(_feed.shortDescription),
        ),
      ),
      onTap: () => _moveToFeedPage(context),
    );
  }
}
