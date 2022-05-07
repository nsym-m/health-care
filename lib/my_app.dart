import 'package:flutter/material.dart';
import 'package:health_care/views/base_tab_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'test',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: BaseTabView(),
    );
  }
}
