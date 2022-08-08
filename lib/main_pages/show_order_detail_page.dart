import 'package:all_log/main_pages/history_page.dart';
import 'package:flutter/material.dart';

class ShowOrderDetailPage extends StatelessWidget {
  ShowOrderDetailPage({
    required this.userName,
    required this.icon,
    required this.uploadPlace,
    required this.downloadPlace,
    required this.uploadTime,
    required this.transType,
    required this.orderNum,
  });

  final int orderNum;
  final String userName;
  final IconData icon;
  final String uploadTime;
  final String uploadPlace;
  final String downloadPlace;
  final String transType;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Заявка № $orderNum",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20.0, color: Colors.black54),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    child: Icon(
                      icon,
                      size: 100.0,
                      color: Colors.red,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    "Место отгрузки: $uploadPlace \nМесто выгрузки: $downloadPlace \nВремя отгрузки: $uploadTime \nТип транспорта: $transType",
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 15.0, color: Colors.black),
                  ),
                ],
              ),
            ),
            FlatButton(
              color: Colors.lightBlueAccent,
              onPressed: () {
                Navigator.pushNamed(context, HistoryPage.id);
              },
              child: Text(
                'Отозваться на заявку',
                style: TextStyle(color: Colors.black54),
              ),
            ),
            FlatButton(
              color: Colors.lightGreenAccent,
              onPressed: () {},
              child: Text(
                'Связаться с грузополучателем',
                style: TextStyle(color: Colors.black54),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
