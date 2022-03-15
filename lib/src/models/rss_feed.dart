import 'package:xml/xml.dart';
import 'package:intl/intl.dart';

class RssCategory {
  String domain;
  String category;

  RssCategory({required this.category, this.domain = ''});
}

class RssItem {
  String title;
  String link;
  String description;
  DateTime publicationDate;
  String guid;
  String author;
  late List<RssCategory> categories = [];

  RssItem({
    required this.title,
    required this.link,
    required this.description,
    required this.guid,
    required this.publicationDate,
    this.author = '',
  });

  String get shortDescription {
    int cutoff = 80;
    return (description.length <= cutoff)
        ? description
        : '${description.substring(0, cutoff)}...';
  }

  static RssItem fromXml(XmlElement xml) {
    String title = xml.findElements('title').first.innerText;
    String link = xml.findElements('link').first.innerText;
    String description = xml.findElements('description').first.innerText;
    String guid = xml.findElements('guid').first.innerText;
    DateFormat format = DateFormat("EEE, dd MMM yyyy hh:mm:ss zzz");
    DateTime publicationDate =
        format.parse(xml.findElements('publicationDate').first.innerText, true);
    String author = xml.findElements('author').first.innerText;
    Iterable<XmlElement> xmlCategories = xml.findElements('category');
    List<RssCategory> categories = [];

    for (XmlElement xmlCategory in xmlCategories) {
      String category = xmlCategory.innerText;
      String? domain = xmlCategory.getAttribute('domain');
      domain = domain ?? '';
      categories.add(RssCategory(category: category, domain: domain));
    }

    RssItem item = RssItem(
        title: title,
        link: link,
        description: description,
        guid: guid,
        publicationDate: publicationDate,
        author: author);
    item.categories = categories;
    return item;
  }
}

class RssFeed {
  String title;
  String link;
  String description;

  List<RssItem> items = [];

  RssFeed({
    required this.title,
    required this.link,
    required this.description,
  });

  static RssFeed fromXml(XmlElement xml) {
    String title = xml.findElements('title').first.innerText;
    String link = xml.findElements('link').first.innerText;
    String description = xml.findElements('description').first.innerText;
    List<RssItem> items =
        xml.findElements('item').map((item) => RssItem.fromXml(item)).toList();

    RssFeed feed = RssFeed(title: title, link: link, description: description);
    feed.items = items;
    return feed;
  }

  String get shortDescription {
    int cutoff = 80;
    return (description.length <= cutoff)
        ? description
        : '${description.substring(0, cutoff)}...';
  }
}
