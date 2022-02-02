import 'package:medicine_app/database/data/record.dart';

import 'package:medicine_app/database/database_helper.dart';

class RecordManager {
  final dbHelper = DatabaseHelper.instance;
  RecordManager._privateConstructor();
  static final RecordManager instance = RecordManager._privateConstructor();
  //插入資料
  void insert() async {
    var record = Record(
        id: 1,
        date: DateTime.now().millisecondsSinceEpoch,
        morningEat: 1,
        noonEat: 1,
        eveningEat: 1,
        beforeSleepEat: 1);

    dbHelper.insert(record.toMap());
    print('--- insert 執行結束---');
  }

  //查詢資料
  void query() async {
    final rows = await dbHelper.queryAllRows();
    print('查詢結果:');
    rows.forEach((row) => print(row));
    print('--- query 執行結束---');
  }

  //更新資料
  void update() async {
    var record = Record(
        id: 1,
        date: DateTime.now().millisecondsSinceEpoch,
        morningEat: 1,
        noonEat: 1,
        eveningEat: 1,
        beforeSleepEat: 1);
    dbHelper.update(record.toMap());
    print('--- update 執行結束---');
  }

  //刪除資料
  void delete() async {
    final id = await dbHelper.queryRowCount();
    dbHelper.delete(id!);
    print('--- delete 執行結束---');
  }
}
