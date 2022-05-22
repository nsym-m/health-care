import 'package:flutter/material.dart';

class HelpView extends StatelessWidget {
  const HelpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Icon(
          Icons.help,
        ),
      ),
    );
  }
}
