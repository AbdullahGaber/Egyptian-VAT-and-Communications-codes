import 'package:flutter/material.dart';
import '../screens/currency_screen.dart';
import '../constants.dart';

class MyDrawer extends StatelessWidget {
  Widget _buildListTile(IconData icon, String title, Function onTap) {
    return Container(
      child: Column(
        children: <Widget>[
          ListTile(
            trailing: Icon(icon),
            title: Text(title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            onTap: onTap,
          ),
          Divider(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            color: Theme.of(context).primaryColor,

            child: Text(
              'القائمة الرئيسية',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            height: 100,
            width: double.infinity,
          ),
          _buildListTile(Icons.phone, 'معرفة صافي الرصيد', () {
            Navigator.of(context).pushNamed(
              CurrencyScreen.routeName,
              arguments: CalculationStyle.PhoneCurrency,
            );
          }),
          _buildListTile(Icons.network_wifi, 'معرفة صافي اشتراك الانترنت', () {
            Navigator.of(context).pushNamed(
              CurrencyScreen.routeName,
              arguments: CalculationStyle.InternetCurrency,
            );
          }),
        ],
      ),
    );
  }
}
