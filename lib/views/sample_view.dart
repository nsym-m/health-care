import 'package:flutter/material.dart';

class SampleView extends StatelessWidget {
  const SampleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Icon(
          Icons.face,
          size: 200,
        ),
      ),
    );
  }
}
