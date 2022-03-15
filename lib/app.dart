import 'package:flutter/material.dart';
import './src/pages/home.dart';
import './src/pages/add_feed.dart';
import './src/pages/view_feed.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RSS Reader',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(title: 'RSS Reader'),
        '/add_feed': (context) => const AddFeedPage(title: 'Add a new feed'),
        '/view_feed': (context) => const ViewFeedPage(),
      },
    );
  }
}
