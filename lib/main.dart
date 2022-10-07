import 'package:all_log/components/order_data.dart';
import 'package:all_log/state/app_state.dart';
import 'package:all_log/state/orders_provider.dart';
import 'package:all_log/welcome_pages/loading_screen.dart';
import 'package:all_log/welcome_pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'driver/driver_order_page.dart';
import 'general/news_page.dart';
import 'package:all_log/welcome_pages/welcome_page.dart';
import 'welcome_pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'general/info_page.dart';
import 'logistician/log_history_page.dart';
import 'general/profile_page.dart';
import 'components/order_data.dart';

// TODO:WRAP main page in MultuProvider
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(AllLogistics());
}

class AllLogistics extends StatefulWidget {
  @override
  State<AllLogistics> createState() => _AllLogisticsState();
}

class _AllLogisticsState extends State<AllLogistics> {
  var logOrderData = null;

  AppStateManager? appStateManager;

  OrderProvider? orderProvider;

  OrderData? orderData;

  @override
  void initState() {
    orderData = OrderData();
    orderProvider = OrderProvider();
    appStateManager = AppStateManager(orderProvider: orderProvider);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => OrderData()),
        ChangeNotifierProvider(create: (context) => appStateManager)
      ],
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.dark(
            primary: (Color(0xFFE9FB47)),
          ),
          scaffoldBackgroundColor: Color(0xFFE9FB47),
        ),
        routes: {
          LoadingScreen.id: (context) => LoadingScreen(),
          ProfilePage.id: (context) => ProfilePage(),
          HistoryPage.id: (context) => HistoryPage(),
          InfoPage.id: (context) => InfoPage(),
          RegisterPage.id: (context) => RegisterPage(),
          LoginPage.id: (context) => LoginPage(),
          WelcomePage.id: (context) => WelcomePage(),
          OrderPage.id: (context) => OrderPage(),
          NewsPage.id: (context) => NewsPage(),
        },
        initialRoute: WelcomePage.id,
      ),
    );
  }
}
