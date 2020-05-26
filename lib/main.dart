import 'package:flutter/material.dart';
import './screens/currency_screen.dart';
import './screens/services_details_screen.dart';
import './screens/services_overview_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'أبو معتز',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        fontFamily: 'Almarai',
        primaryColor:  Colors.green[500],
        canvasColor:  Colors.yellow[50],
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ServicesOverviewScreen(),
      routes: {
        ServicesDetailsScreen.routeName:(ctx)=>ServicesDetailsScreen(),
        CurrencyScreen.routeName : (ctx)=>CurrencyScreen(),

      },
    );
  }
}
