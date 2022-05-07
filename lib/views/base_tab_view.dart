
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_care/views/calendar_view.dart';
import 'package:health_care/views/health_app_view.dart';
import 'package:health_care/views/my_home_view.dart';

final baseTabViewProvider = StateProvider((ref) => PageType.home);

enum PageType { home, calendar, health }

class BaseTabView extends ConsumerWidget {
  BaseTabView({Key? key}) : super(key: key);

  final widgets = [
    const MyHomeView(),
    const CalendarView(),
    HealthAppView(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final page = ref.watch(baseTabViewProvider.state);
    return Scaffold(
      appBar: AppBar(title: Text(page.state.name)),
      body: widgets[page.state.index],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month), label: 'calendar'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'health'),
        ],
        currentIndex: page.state.index,
        onTap: (int index) => page.state = PageType.values[index],
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
