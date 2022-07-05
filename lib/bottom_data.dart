import 'package:flutter/material.dart';
import 'constants.dart';

class BottomPanelWidget extends StatelessWidget {
  BottomPanelWidget();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ItemContent(icon: Icons.menu_book, title: 'Заказы'),
            ItemContent(icon: Icons.newspaper, title: 'Новости'),
            ItemContent(icon: Icons.info, title: 'Инфо'),
            ItemContent(icon: Icons.history, title: 'История'),
            ItemContent(icon: Icons.person, title: 'Профиль'),
          ],
        ),
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
