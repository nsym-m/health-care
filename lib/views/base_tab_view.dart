import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_care/views/calendar_view.dart';
import 'package:health_care/views/health_app_view.dart';
import 'package:health_care/views/my_home_view.dart';

final baseTabViewProvider = StateProvider((ref) => PageType.health);

enum PageType { calendar, health, home }

extension ParseToString on PageType {
  String toShortString() {
    return toString().split('.').last;
  }
}

class BaseTabView extends StatelessWidget {
  BaseTabView({Key? key}) : super(key: key);

  final widgets = [
    const CalendarView(),
    const MyHomeView(),
    HealthAppView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final page = ref.watch(baseTabViewProvider.state);
        return Scaffold(
          appBar: AppBar(title: Text(page.state.toShortString())),
          body: widgets[page.state.index],
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), label: 'calendar'),
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'health'),
            ],
            currentIndex: page.state.index,
            onTap: (int index) => {
              log(index.toString()),
              log(page.state.toString()),
              page.state = PageType.values[index],
            },
            type: BottomNavigationBarType.fixed,
          ),
        );
      },
    );
  }
}
