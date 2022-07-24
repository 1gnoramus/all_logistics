import 'package:all_log/new_order_page.dart';
import 'package:flutter/material.dart';
import 'components/order_info.dart';
import 'components/bottom_data.dart';
import 'package:all_log/components/order_type.dart';

class NewsPage extends StatefulWidget {
  static String id = 'news_page';

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          BottomPanelWidget(),
        ],
      ),
    );
  }
}
