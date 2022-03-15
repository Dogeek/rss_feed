import 'package:rss_feed/src/models/rss_feed.dart';
import 'package:xml/xml.dart';

String xmlDocumentString = '''
<rss version="2.0">
<channel>
  <title>Liftoff News</title>
  <link>http://liftoff.msfc.nasa.gov/</link>
  <description>Liftoff to Space Exploration.</description>
  <language>en-us</language>
  <pubDate>Tue, 10 Jun 2003 04:00:00 GMT</pubDate>
  <lastBuildDate>Tue, 10 Jun 2003 09:41:01 GMT</lastBuildDate>
  <docs>http://blogs.law.harvard.edu/tech/rss</docs>
  <generator>Weblog Editor 2.0</generator>
  <managingEditor>editor@example.com</managingEditor>
  <webMaster>webmaster@example.com</webMaster>
  <item>
    <title>Star City</title>
    <link>http://liftoff.msfc.nasa.gov/news/2003/news-starcity.asp</link>
    <description>How do Americans get ready to work with Russians aboard the International Space Station? They take a crash course in culture, language and protocol at Russia's <a href="http://howe.iki.rssi.ru/GCTC/gctc_e.htm">Star City</a>.</description>
    <pubDate>Tue, 03 Jun 2003 09:39:21 GMT</pubDate>
    <guid>http://liftoff.msfc.nasa.gov/2003/06/03.html#item573</guid>
  </item>
  <item>
    <description>Sky watchers in Europe, Asia, and parts of Alaska and Canada will experience a <a href="http://science.nasa.gov/headlines/y2003/30may_solareclipse.htm">partial eclipse of the Sun</a> on Saturday, May 31st.</description>
    <pubDate>Fri, 30 May 2003 11:06:42 GMT</pubDate>
    <guid>http://liftoff.msfc.nasa.gov/2003/05/30.html#item572</guid>
  </item>
  <item>
    <title>The Engine That Does More</title>
    <link>http://liftoff.msfc.nasa.gov/news/2003/news-VASIMR.asp</link>
    <description>Before man travels to Mars, NASA hopes to design new engines that will let us fly through the Solar System more quickly. The proposed VASIMR engine would do that.</description>
    <pubDate>Tue, 27 May 2003 08:37:32 GMT</pubDate>
    <guid>http://liftoff.msfc.nasa.gov/2003/05/27.html#item571</guid>
  </item>
  <item>
    <title>Astronauts' Dirty Laundry</title>
    <link>http://liftoff.msfc.nasa.gov/news/2003/news-laundry.asp</link>
    <description>Compared to earlier spacecraft, the International Space Station has many luxuries, but laundry facilities are not one of them. Instead, astronauts have other options.</description>
    <pubDate>Tue, 20 May 2003 08:56:02 GMT</pubDate>
    <guid>http://liftoff.msfc.nasa.gov/2003/05/20.html#item570</guid>
  </item>
  </channel>
</rss>
''';

String xmlItemString = '''
  <item>
    <title>Title</title>
    <link>https://www.example.com</link>
    <description>Lorem ipsum dolor sit amet, consectetur...</description>
    <pubDate>Tue, 20 May 2003 08:56:02 GMT</pubDate>
    <guid>GUID</guid>
  </item>
''';

void testChannel() {
  XmlDocument xml = XmlDocument.parse(xmlDocumentString);
  XmlElement rss = xml.findElements('rss').first;
  List<XmlElement> channels = rss.findElements('channel').toList();
  RssFeed feed = RssFeed.fromXml(channels[0]);
  assert(feed.title == 'Liftoff News');
}

void testSingleItem() {
  XmlElement xmlItem = XmlDocument.parse(xmlItemString).rootElement;
  RssItem rssItem = RssItem.fromXml(xmlItem);

  assert(rssItem.title == 'Title');
  assert(rssItem.link == 'https://www.example.com');
  assert(rssItem.description == 'Lorem ipsum dolor sit amet, consectetur...');
  assert(rssItem.publicationDate == DateTime.parse('2003-05-20T08:56:02.000Z'));
  assert(rssItem.guid == 'GUID');
}

void main() {
  testSingleItem();
  testChannel();
}
