import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Time Zone',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int t = 0;
  final TextEditingController country = TextEditingController();
  final TextEditingController BD_time_hour = TextEditingController();
  final TextEditingController BD_time_mint = TextEditingController();
  String r = "Time = 0 : 00";
  String dem = "";
  void TimeZone() {
    String? cntry = country.text;
    int? BD_timeh = int.parse(BD_time_hour.text);
    int? BD_timemint = int.parse(BD_time_mint.text);
    if (cntry != null && BD_timeh != null && BD_timemint != null) {
      if (cntry == "USA" || cntry == "America") {
        t = BD_timeh + 10;
        if (t > 12) {
          dem = "PM";
        } else
          dem = "AM";
      } else if (cntry == "UK" || cntry == "London") {
        t = BD_timeh + 5;
        if (t > 12) {
          dem = "PM";
        } else
          dem = "AM";
      }
      setState(() {
        r = "Time = $t : $BD_timemint $dem";
      });
    } else {
      setState(() {
        r = "Please complete the boxes";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Time Zone'), centerTitle: true),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: country,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Enter Country Name',
                border: OutlineInputBorder(),
              ),
            ),
            TextField(
              controller: BD_time_hour,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter BD hours',
                border: OutlineInputBorder(),
              ),
            ),
            TextField(
              controller: BD_time_mint,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter BD minutes ',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: TimeZone, child: Text('Measure')),
            SizedBox(height: 20),
            Text(
              r,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
