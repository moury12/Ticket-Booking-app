
import 'package:daakTicket/pages/BusDetails.dart';
import 'package:daakTicket/pages/adminPage.dart';
import 'package:daakTicket/pages/admindashboard.dart';
import 'package:daakTicket/pages/bus_list_page.dart';
import 'package:daakTicket/pages/launcher_page.dart';
import 'package:daakTicket/pages/login_page.dart';
import 'package:daakTicket/pages/new_bus_add.dart';
import 'package:daakTicket/pages/onboarding.dart';
import 'package:daakTicket/pages/user.dart';
import 'package:daakTicket/pages/userSearchbus.dart';
import 'package:daakTicket/pages/welcome.dart';
import 'package:daakTicket/providers/bus_provider.dart';
import 'package:daakTicket/providers/ticketprovider.dart';
import 'package:daakTicket/providers/user_provider.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool("showHome") ?? false;

  runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => BusProvider()),
            ChangeNotifierProvider(create: (context)=>UserProvider()),

          ],
          child:  MyApp(showHome:showHome)));
}

class MyApp extends StatelessWidget {
  final bool showHome;


  const
  MyApp({super.key, required this.showHome});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Daak Ticket',
      theme: ThemeData(

        primarySwatch: Colors.indigo,
      ),
      home: showHome? const welcome(): OnBoarding() ,

      routes: {
        LoginPage.routeName:(context)=>const LoginPage(),
        LauncherPage.routeName:(context)=>const LauncherPage(),
        BusListPage.routeName:(context)=>BusListPage(),
        NewBusAddPage.routeName:(context)=>NewBusAddPage(),
        Admin_page.routeName:(context)=>const Admin_page(),
        Dashboard.routeName:(context)=>const Dashboard(),
        BusDetails.routeName:(context)=>const BusDetails(),
        Home_page.routeName:(context)=>const Home_page(),
        USer_page.routeName:(context)=>const USer_page(),

      },
    );
  }
}


