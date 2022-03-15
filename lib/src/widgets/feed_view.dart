import 'package:flutter/material.dart';
import 'item_card.dart';
import '../models/rss_feed.dart';

class FeedView extends StatelessWidget {
  const FeedView({Key? key, required RssFeed feed})
      : _feed = feed,
        super(key: key);

  final RssFeed _feed;

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView(
        children: _feed.items.map((item) => ItemCard(item: item)).toList(),
      ),
      scrollbarOrientation: ScrollbarOrientation.right,
    );
  }
}
