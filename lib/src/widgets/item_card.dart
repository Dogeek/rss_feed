import 'package:flutter/material.dart';
import '../models/rss_feed.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({Key? key, required RssItem item}) : _item = item, super(key: key);

  final RssItem _item;

  void _moveToItemPage(BuildContext context) {
    Navigator.pushNamed(context, '/view_item', arguments:_item);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        child: ListTile(
          leading: const Icon(Icons.abc_sharp),
          title: Text(_item.title),
          subtitle: Text(_item.shortDescription),
        ),
      ),
      onTap: () => _moveToItemPage(context),
    );
  }
}
