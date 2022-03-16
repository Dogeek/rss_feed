import 'package:flutter/material.dart';
import '../widgets/item_view.dart';
import '../models/rss_feed.dart';
import 'package:share_plus/share_plus.dart';

class ViewItemPage extends StatefulWidget {
  const ViewItemPage({Key? key}) : super(key: key);

  @override
  State<ViewItemPage> createState() => _ViewItemPageState();
}

class _ViewItemPageState extends State<ViewItemPage> {
  void _doShareItem(RssItem item) async {
    await Share.share(
      '${item.title} -- ${item.shortDescription}',
    );
  }

  @override
  Widget build(BuildContext context) {
    final item = ModalRoute.of(context)!.settings.arguments as RssItem;

    return Scaffold(
      appBar: AppBar(
        title: Text(item.title),
        actions: [
          PopupMenuButton(
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
              PopupMenuItem(
                onTap: () => _doShareItem(item),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const <Widget>[
                    Icon(
                      Icons.share_sharp,
                      color: Color(0xFF101010),
                    ),
                    Text('Share'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: ItemView(item: item),
    );
  }
}
