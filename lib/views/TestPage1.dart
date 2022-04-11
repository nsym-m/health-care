import 'package:flutter/material.dart';
import 'package:health_care/views/TestPage2.dart';

class TestPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("sample app"),
        ),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextButton(
              onPressed: () => {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return TestPage2();
                    }))
                  },
              child: Text("進む", style: TextStyle(fontSize: 80))),
          TextButton(
              onPressed: () => {Navigator.of(context).pop()},
              child: Text("戻る", style: TextStyle(fontSize: 80)))
        ])));
  }
}
