import 'package:flutter/material.dart';
import '../screens/services_details_screen.dart';

class ServicesItem extends StatelessWidget {
  final String name;
  final String image;
  final String id;
  ServicesItem({
    @required this.name,
    @required this.image,
    @required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(ServicesDetailsScreen.routeName, arguments: {
          'title':name,
          'id':id});
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          border: Border.all(width: 1.0, color: Colors.grey),
        ),
        height: 150.0,
        width: 150.0,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            )),
      ),
    );
  }
}
