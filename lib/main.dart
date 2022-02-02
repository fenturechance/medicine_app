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
        ),
        debugShowCheckedModeBanner: false);
  }
}

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

dynamic getData() async {
  List<Map> res = await RecordManager.instance.query();
  if (res.length > 0) {
    String dateFromDB = DateFormat('yyyy/MM/dd')
        .format(DateTime.fromMillisecondsSinceEpoch(res[0]['date']));

    String nowDate = DateFormat('yyyy/MM/dd').format(DateTime.now());
    if (dateFromDB != nowDate) {
      await RecordManager.instance.update();
      res = await RecordManager.instance.query();
    }
    return Future.value(res);
  } else {
    await RecordManager.instance.insert();
    return RecordManager.instance.query();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  Future future = getData();
  void setFuture() {
    setState(() {
      future = getData();
    });
  }

  Widget build(BuildContext context) {
    return Container(
        child: FutureBuilder(
      future: future,
      builder: (BuildContext context, AsyncSnapshot snap) {
        if (snap.hasData) {
          return generateLayout(
              context: context, data: snap.data[0], setFuture: setFuture);
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    ));
  }
}

Widget generateLayout({context, data, setFuture}) {
  Size size = MediaQuery.of(context).size;
  String nowDate = DateFormat('yyyy/MM/dd EEEE').format(DateTime.now());
  return Stack(children: [
    Container(
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              nowDate,
              style: const TextStyle(color: Color(0xff27726c), fontSize: 25.0),
            ),
            const SizedBox(
              height: 15.0,
            ),
            generateButton(
                text: '早', data: data, key: 'morningEat', setFuture: setFuture),
            generateButton(
                text: '中', data: data, key: 'noonEat', setFuture: setFuture),
            generateButton(
                text: '晚', data: data, key: 'eveningEat', setFuture: setFuture),
            generateButton(
                text: '睡',
                data: data,
                key: 'beforeSleepEat',
                setFuture: setFuture),
          ],
        ),
      ),
    ),
    Positioned(
        bottom: 10,
        left: 10,
        child: Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/dinosaur.png'),
                  fit: BoxFit.contain)),
        ))
  ]);
}

Widget generateButton(
    {String text = '', Map? data, String? key, Function? setFuture}) {
  int active = data![key];
  int bgColor = active == 1 ? 0xffbee0d5 : 0xffffd6d7;
  int textColor = active == 1 ? 0xff27726c : 0xffe06667;
  return Container(
      margin: const EdgeInsets.only(top: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 0,
            primary: Color(bgColor),
            minimumSize: const Size.fromHeight(100)),
        child: Text(
          text,
          style: TextStyle(fontSize: 20, color: Color(textColor)),
        ),
        onPressed: () async {
          await RecordManager.instance.update(type: key);
          setFuture!();
        },
      ));
}
