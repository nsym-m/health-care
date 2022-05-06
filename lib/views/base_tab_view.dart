import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_care/views/health_app_view.dart';
import 'package:health_care/views/my_home_view.dart';

final baseTabViewProvider = StateProvider<PageType>((ref) => PageType.health);

enum PageType {
  health,
  home,
}

class BaseTabView extends StatelessWidget {
  // BaseTabView({Key? key}) : super(key: key);

  final List<Widget> _pageWidgets = <Widget>[
    HealthAppView(),
    const MyHomeView(title: 'test'),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
      final page = ref.watch(baseTabViewProvider.notifier);
      log(page.state.toString());
      return Scaffold(
        body: _pageWidgets[page.state.index],
        bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'health'),
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
            ],
            currentIndex: page.state.index,
            onTap: (index) => {
                  page.state = PageType.values[index],
                  log(page.state.toString())
                },
            type: BottomNavigationBarType.fixed),
      );
    });
  }
}
