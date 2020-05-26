import 'package:flutter/material.dart';
import '../constants.dart';

class CurrencyScreen extends StatefulWidget {
  static const routeName = 'currency';

  @override
  _CurrencyScreenState createState() => _CurrencyScreenState();
}

class _CurrencyScreenState extends State<CurrencyScreen> {
  var _isInit = true;
  var _currencyController = TextEditingController();
  var _formKey = GlobalKey<FormState>();
  double _currency;
  void _onCompleted() {
    var _validate = _formKey.currentState.validate();
    if (!_validate) {
      return;
    }
    _formKey.currentState.save();

    if (_isPhoneCurrency) {
      _currency = _currency * 1.3;
      _currency = _currency + (_currency * 0.1);
    } else {
      _currency = _currency * 1.14;
    }
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('تمت'),
        content: Text('${_currency.toStringAsFixed(2)} : المبلغ المراد دفعه'),
        actions: <Widget>[
          FlatButton(
            child: Text('موافق'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  var _isPhoneCurrency = false;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      var route = ModalRoute.of(context).settings.arguments as CalculationStyle;
      if (route == CalculationStyle.PhoneCurrency) {
        setState(() {
          _isPhoneCurrency = true;
        });
      }
    }
    _isInit = false;
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: _isPhoneCurrency ? Colors.orangeAccent : Colors.purple,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(vertical: 50.0),
                  height: mediaQuery.size.height*0.23,
                  width: 300,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Image.asset(
                      _isPhoneCurrency ? 'images/phone.jpg' : 'images/we.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    width:  mediaQuery.size.width*0.80,
                    child: Form(
                      key: _formKey,
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        validator: (val) {
                          if (val == null) {
                            return 'من فضلك قم بإدخال القيمة';
                          }
                          if (double.tryParse(val.trim()) == null) {
                            return 'قم بإدخال أرقام';
                          }
                          if (double.parse(val.trim()) <= 5) {
                            return 'قم بإدخال رقم أكبر من ال5';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _currency = double.parse(value.trim());
                        },
                        textAlign: TextAlign.center,
                        controller: _currencyController,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: _isPhoneCurrency
                              ? 'قم بإدخال صافي الرصيد المراد شحنه'
                              : 'قم بإدخال قيمة صافي الفاتورة',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide(
                              width: 1.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height:  mediaQuery.size.height*0.25,
                ),
                Container(
                  height:  mediaQuery.size.height*0.07,
                  width:  mediaQuery.size.width*0.50,
                  child: RawMaterialButton(
                    child: Text(
                      'إحسب',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    elevation: 5.0,
                    onPressed: _onCompleted,
                    fillColor:
                        _isPhoneCurrency ? Colors.blueAccent : Colors.amber,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
                SizedBox(
                  height:  mediaQuery.size.height*0.02,
                ),
                _isPhoneCurrency
                    ? Container()
                    : Text(
                        'المبلغ غير شامل الخدمة الإضافية لماكينة فوري وغيرها',
                        style: TextStyle(
                          color: Colors.amberAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                SizedBox(
                  height:  mediaQuery.size.height*0.01,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
