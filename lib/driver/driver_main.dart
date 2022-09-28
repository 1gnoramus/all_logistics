import 'package:all_log/logistician/log_history_page.dart';
import 'package:all_log/general/info_page.dart';
import 'package:all_log/general/news_page.dart';
import 'package:all_log/driver/driver_order_page.dart';
import 'package:all_log/general/profile_page.dart';
import 'package:flutter/material.dart';
import '../components/constants.dart';

class BottomNavBar extends StatefulWidget {

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
} 

class _BottomNavBarState extends State<BottomNavBar> {
  int selectedIndex = 0;
  final screens = [OrderPage(), NewsPage(), InfoPage(),HistoryPage(),ProfilePage()];

  @override
  Widget build(BuildContext context) {
     return Scaffold(
       bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xFFE9FB47),
        currentIndex: selectedIndex,
        onTap: (int index)  {
    setState(() {      
      selectedIndex = index;
    });    

  },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Заказы', ),
            BottomNavigationBarItem(icon: Icon(Icons.newspaper), label: 'Новости'),
            BottomNavigationBarItem(
                icon: Icon(Icons.info), label: 'Инфо'),
                          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'История'),
            BottomNavigationBarItem(
                icon: Icon(Icons.perm_identity), label: 'Профиль'),
          ],
        ),
        body: screens[selectedIndex],
     );
  }
}

    
     
    // Container(
    //   color: Colors.black38,
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     children: [
    //       GestureDetector(
    //         onTap: () {
    //           Navigator.pushNamed(context, OrderPage.id);
    //         },
    //         child: ItemContent(
    //             icon: Icons.menu_book,
    //             title: 'Заказы',
    //             isClicked: clickedButton == 'Orders' ? true : false),
    //       ),
    //       GestureDetector(
    //         onTap: () {
    //           Navigator.pushNamed(
    //             context,
    //             NewsPage.id,
    //           );
    //         },
    //         child: ItemContent(
    //           icon: Icons.newspaper,
    //           title: 'Новости',
    //           isClicked: clickedButton == 'News' ? true : false,
    //         ),
    //       ),
    //       GestureDetector(
    //           onTap: () {
    //             Navigator.pushNamed(context, InfoPage.id);
    //           },
    //           child: ItemContent(
    //               icon: Icons.info,
    //               title: 'Инфо',
    //               isClicked: clickedButton == 'Info' ? true : false)),
    //       GestureDetector(
    //         onTap: () {
    //           Navigator.pushNamed(context, HistoryPage.id);
    //         },
    //         child: ItemContent(
    //             icon: Icons.history,
    //             title: 'История',
    //             isClicked: clickedButton == 'History' ? true : false),
    //       ),
    //       GestureDetector(
    //         onTap: () {
    //           Navigator.pushNamed(context, ProfilePage.id);
    //         },
    //         child: ItemContent(
    //             icon: Icons.person,
    //             title: 'Профиль',
    //             isClicked: clickedButton == 'Profile' ? true : false),
    //       ),
    //     ],
    //   ),
    // );


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
