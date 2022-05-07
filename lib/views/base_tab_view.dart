import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_care/views/health_app_view.dart';
import 'package:health_care/views/my_home_view.dart';
import 'package:health_care/views/sample_view.dart';

final baseTabViewProvider = StateProvider((ref) => 0);

class BaseTabView extends StatelessWidget {
  BaseTabView({Key? key}) : super(key: key);

  final widgets = [
    const MyHomeView(),
    const SampleView(),
    HealthAppView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final page = ref.watch(baseTabViewProvider.notifier);
        return Scaffold(
          body: widgets[page.state],
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'sample'),
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'health'),
            ],
            currentIndex: page.state,
            onTap: (int index) => {
              log(index.toString()),
              log(page.state.toString()),
              page.state = index,
            },
            type: BottomNavigationBarType.fixed,
          ),
        );
      },
    );
  }
}
