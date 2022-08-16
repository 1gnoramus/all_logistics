import 'package:flutter/foundation.dart';
import 'package:all_log/main_pages/history_page.dart';

class OrderData extends ChangeNotifier {
  List urgOrderBoxes = [];
  List comOrderBoxes = [];
  List inProcHistList = [];
  List acceptedHistList = [];
  List rejectedHistList = [];
  List ordersIDList = [];
}
