import 'package:all_log/main_pages/news_page.dart';
import 'package:all_log/main_pages/order_page.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class BottomPanelWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, OrderPage.id);
            },
            child: ItemContent(icon: Icons.menu_book, title: 'Заказы'),
          ),
          GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  NewsPage.id,
                );
              },
              child: ItemContent(icon: Icons.newspaper, title: 'Новости')),
          GestureDetector(child: ItemContent(icon: Icons.info, title: 'Инфо')),
          GestureDetector(
              child: ItemContent(icon: Icons.history, title: 'История')),
          GestureDetector(
              child: ItemContent(icon: Icons.person, title: 'Профиль')),
        ],
      ),
    );
  }
}

class ItemContent extends StatelessWidget {
  ItemContent({required this.icon, required this.title});
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 40.0,
          color: Colors.grey.shade800,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: kBottomPanelTextStyle,
        ),
      ],
    );
  }
}
