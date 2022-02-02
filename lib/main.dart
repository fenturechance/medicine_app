import 'package:flutter/material.dart';
import 'package:medicine_app/database/manager/record_manager.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: const Color(0xffa2c4ca),
      body: HomePage(),
    ));
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String nowDate = DateFormat('yyyy/MM/dd EEEE').format(DateTime.now());
    return Container(
        padding: EdgeInsets.all(10.0),
        width: size.width,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                nowDate,
                style: TextStyle(color: Color(0xff27726c), fontSize: 25.0),
              ),
              SizedBox(
                height: 15.0,
              ),
              generateButton(text: '早'),
              generateButton(text: '中'),
              generateButton(text: '晚'),
              generateButton(text: '睡'),
            ],
          ),
        ));
  }
}

Widget generateButton({String text = ''}) {
  return Container(
      margin: EdgeInsets.only(top: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 0,
            primary: const Color(0xffffd6d7),
            minimumSize: const Size.fromHeight(100)),
        child: Text(
          text,
          style: TextStyle(fontSize: 20, color: Color(0xffe06667)),
        ),
        onPressed: () {
          RecordManager.instance.insert();
        },
      ));
}
