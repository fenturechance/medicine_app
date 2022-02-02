import 'package:flutter/material.dart';
import 'package:medicine_app/database/manager/record_manager.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text('HKT線上教室'),
      ),
      body: HomePage(),
    ));
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            child: const Text(
              '新增',
              style: TextStyle(fontSize: 20),
            ),
            onPressed: () {
              RecordManager.instance.insert();
            },
          ),
          ElevatedButton(
            child: const Text(
              '查詢',
              style: TextStyle(fontSize: 20),
            ),
            onPressed: () {
              RecordManager.instance.query();
            },
          ),
          ElevatedButton(
            child: const Text(
              '修改',
              style: TextStyle(fontSize: 20),
            ),
            onPressed: () {
              RecordManager.instance.update();
            },
          ),
          ElevatedButton(
            child: const Text(
              '刪除',
              style: TextStyle(fontSize: 20),
            ),
            onPressed: () {
              RecordManager.instance.delete();
            },
          ),
        ],
      ),
    );
  }
}
