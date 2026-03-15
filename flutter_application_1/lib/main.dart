import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  // ignore: await_only_futures
  await Hive.initFlutter;
  await Hive.openBox("mybox");

  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Home());
  }
}
