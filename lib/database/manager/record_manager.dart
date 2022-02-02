import 'package:medicine_app/database/data/record.dart';

import 'package:medicine_app/database/database_helper.dart';

class RecordManager {
  final dbHelper = DatabaseHelper.instance;
  RecordManager._privateConstructor();
  static final RecordManager instance = RecordManager._privateConstructor();
  //插入資料
  Future insert() async {
    var record = Record(
        id: 1,
        date: DateTime.now().millisecondsSinceEpoch,
        morningEat: 1,
        noonEat: 1,
        eveningEat: 1,
        beforeSleepEat: 1);

    return dbHelper.insert(record.toMap());
  }

  //查詢資料
  Future query() {
    return dbHelper.queryAllRows();
    // print('查詢結果:');
    // rows.forEach((row) => print(row));
    // print('--- query 執行結束---');
  }

  int setContrast(data) {
    return data == 1 ? 0 : 1;
  }

  int setBoolResult(data, type, key) {
    return type == key ? setContrast(data[key]) : data[key];
  }
  //更新資料
  Future update(type) async {
    List<Map> res = await query();
    Map data = res[0];
    int morningEat = setBoolResult(data, type, 'morningEat');
    int noonEat = setBoolResult(data, type, 'noonEat');
    int eveningEat = setBoolResult(data, type, 'eveningEat');
    int beforeSleepEat = setBoolResult(data, type, 'beforeSleepEat');
    var record = Record(
        id: 1,
        date: DateTime.now().millisecondsSinceEpoch,
        morningEat: morningEat,
        noonEat: noonEat,
        eveningEat: eveningEat,
        beforeSleepEat: beforeSleepEat);
    return dbHelper.update(record.toMap());
  }

  //刪除資料
  void delete() async {
    final id = await dbHelper.queryRowCount();
    dbHelper.delete(id!);
    print('--- delete 執行結束---');
  }
}
