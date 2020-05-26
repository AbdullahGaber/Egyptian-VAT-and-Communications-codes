import 'package:flutter/material.dart';
import '../models/sim_code.dart';
import '../widgets/services_item.dart';
import '../widgets/drawer_item.dart';

class ServicesOverviewScreen extends StatelessWidget {
  static const routeName = '/services-overview';
  final List<Services> myServices = [
    Services(
      id: 'v1',
      name: 'فودافون',
      image: 'images/vodafone.jpg',
    ),
    Services(
      id: 'o1',
      name: 'أورنج',
      image: 'images/orange.png',
    ),
    Services(
      id: 'e1',
      name: 'إتصالات',
      image: 'images/etisalat.jpg',
    ),
    Services(
      id: 'w1',
      name: 'المصرية للإتصالات',
      image: 'images/we-te.jpg',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
 
      drawer: MyDrawer() ,
      appBar: AppBar(
 
        title: Text('أكواد الشبكات'),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10.0),
        itemCount: myServices.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 15 / 14.5,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemBuilder: (ctx, i) => ServicesItem(
          name: myServices[i].name,
          id: myServices[i].id,
          image: myServices[i].image,
        ),
      ),
    );
  }
}
