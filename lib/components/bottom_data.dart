import 'package:all_log/main_pages/history_page.dart';
import 'package:all_log/main_pages/info_page.dart';
import 'package:all_log/main_pages/news_page.dart';
import 'package:all_log/main_pages/order_page.dart';
import 'package:all_log/main_pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class BottomPanelWidget extends StatelessWidget {
  BottomPanelWidget(this.clickedButton);

  final String clickedButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black38,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, OrderPage.id);
            },
            child: ItemContent(
                icon: Icons.menu_book,
                title: 'Заказы',
                isClicked: clickedButton == 'Orders' ? true : false),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                NewsPage.id,
              );
            },
            child: ItemContent(
              icon: Icons.newspaper,
              title: 'Новости',
              isClicked: clickedButton == 'News' ? true : false,
            ),
          ),
          GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, InfoPage.id);
              },
              child: ItemContent(
                  icon: Icons.info,
                  title: 'Инфо',
                  isClicked: clickedButton == 'Info' ? true : false)),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, HistoryPage.id);
            },
            child: ItemContent(
                icon: Icons.history,
                title: 'История',
                isClicked: clickedButton == 'History' ? true : false),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, ProfilePage.id);
            },
            child: ItemContent(
                icon: Icons.person,
                title: 'Профиль',
                isClicked: clickedButton == 'Profile' ? true : false),
          ),
        ],
      ),
    );
  }
}

class ItemContent extends StatelessWidget {
  ItemContent(
      {required this.icon, required this.title, required this.isClicked});

  final IconData icon;
  final String title;
  final bool isClicked;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 40.0,
          color: isClicked ? Colors.black38 : Colors.white,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: kBottomPanelTextStyle.copyWith(
            color: isClicked ? Colors.black38 : Colors.white,
          ),
        ),
      ],
    );
  }
}
