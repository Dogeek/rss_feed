import 'package:flutter/material.dart';
import '../models/rss_feed.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({Key? key, required RssItem item}) : _item = item, super(key: key);

  final RssItem _item;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.abc_sharp),
        title: Text(_item.title),
        subtitle: Text(_item.shortDescription),
      ),
    );
  }
}
