import 'package:flutter/material.dart';
import '../models/rss_feed.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';

class ItemView extends StatelessWidget {
  const ItemView({Key? key, required RssItem item})
      : _item = item,
        super(key: key);

  final RssItem _item;

  void _launchUrl(String? url) async {
    if (url != null && !await launch(url)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView(
        children: <Widget>[
          Text(
            _item.title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                _item.author ?? '',
                style: const TextStyle(
                  fontStyle: FontStyle.italic,
                ),
              ),
              Text(
                'at ${_item.publicationDateString}',
                style: const TextStyle(
                  color: Color(0xFFAAAAAA),
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
          Html(
            data: _item.description,
            onLinkTap: (url, _, __, ___) => _launchUrl(url),
          ),
        ],
      ),
      scrollbarOrientation: ScrollbarOrientation.right,
    );
  }
}
