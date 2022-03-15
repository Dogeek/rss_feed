import 'package:flutter/material.dart';
import '../widgets/item_view.dart';
import '../models/rss_feed.dart';

class ViewItemPage extends StatefulWidget {
  const ViewItemPage({Key? key}) : super(key: key);

  @override
  State<ViewItemPage> createState() => _ViewItemPageState();
}

class _ViewItemPageState extends State<ViewItemPage> {
  @override
  Widget build(BuildContext context) {
    final item = ModalRoute.of(context)!.settings.arguments as RssItem;

    return Scaffold(
      appBar: AppBar(
        title: Text(item.title),
      ),
      body: ItemView(item: item),
    );
  }
}
