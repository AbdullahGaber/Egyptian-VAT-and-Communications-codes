import 'package:flutter/services.dart';

import '../constants.dart';
import 'package:flutter/material.dart';
import '../models/sim_code.dart';

class ServicesDetailsScreen extends StatefulWidget {
  static const routeName = '/services-details';
  @override
  _ServicesDetailsScreenState createState() => _ServicesDetailsScreenState();
}

class _ServicesDetailsScreenState extends State<ServicesDetailsScreen> {
  var _isInit = true;
  String servId = '';
  String title = '';
  var scaffoldKey = GlobalKey<ScaffoldState>();

  List<SimCode> get myEditedCode {
    return myCode.where((serv) => serv.id == servId).toList();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final receivedData =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      setState(() {
        servId = receivedData['id'];
        title = receivedData['title'];
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  Color get myCustomBarColor {
    if (servId == 'v1') {
      return Colors.red;
    } else if (servId == 'o1') {
      return Colors.orange;
    } else if (servId == 'e1') {
      return Colors.green;
    } else {
      return Colors.purple;
    }
  }

  Color get myCustomColor {
    if (servId == 'v1') {
      return Colors.red[300];
    } else if (servId == 'o1') {
      return Colors.orange[300];
    } else if (servId == 'e1') {
      return Colors.green[300];
    } else {
      return Colors.purple[300];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: myCustomColor,
      appBar: AppBar(
        backgroundColor: myCustomBarColor,
        title: Text(title),
      ),
      body: Column(
        children: <Widget>[
          Text(
            'النقر مطولا على الكود للنسخ',
            style: TextStyle(color: Colors.white),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.85,
            child: ListView.builder(
              itemCount: myEditedCode.length,
              itemBuilder: (ctx, i) => Card(
                margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: ListTile(
                  onLongPress: () {
                    scaffoldKey.currentState.removeCurrentSnackBar();
                    Clipboard.setData(ClipboardData(
                      text: myEditedCode[i].serviceCode,
                    ));
                    scaffoldKey.currentState.showSnackBar(SnackBar(
                      duration: Duration(seconds: 3),
                      content: Text('تم نسخ الكود إلى الحافظة بنجاح'),
                    ));
                  },
                  trailing: Text(myEditedCode[i].serviceName),
                  leading: Text(myEditedCode[i].serviceCode),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
