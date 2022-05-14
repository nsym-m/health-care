import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarView extends ConsumerWidget {
  const CalendarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const calendarFormat = CalendarFormat.month;
    var focusedDay = DateTime.now();
    DateTime? selectedDay;
    final kToday = DateTime.now();
    final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
    final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);
    // final viewModel = ref.watch(myHomeViewModelProvider);

    return Scaffold(
      body: Column(
        children: [
          TableCalendar<dynamic>(
            firstDay: kFirstDay,
            lastDay: kLastDay,
            focusedDay: focusedDay,
            calendarFormat: calendarFormat,
            selectedDayPredicate: (day) {
              // Use `selectedDayPredicate` to determine which day is currently selected.
              // If this returns true, then `day` will be marked as selected.

              // Using `isSameDay` is recommended to disregard
              // the time-part of compared DateTime objects.
              return isSameDay(selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              log(selectedDay.toString());
              log(focusedDay.toString());
              // if (!isSameDay(selectedDay, selectedDay)) {
              //   // Call `setState()` when updating the selected day
              //   setState(() {
              //     _selectedDay = selectedDay;
              //     _focusedDay = focusedDay;
              //   });
              // }
            },
            onFormatChanged: (format) {
              log(format.toString());
              // if (_calendarFormat != format) {
              //   // Call `setState()` when updating calendar format
              //   setState(() {
              //     _calendarFormat = format;
              //   });
              // }
            },
            onPageChanged: (changeDay) {
              log(changeDay.toString());
              // No need to call `setState()` here
              focusedDay = changeDay;
            },
            calendarBuilders: CalendarBuilders<dynamic>(
              markerBuilder: (context, date, events) {
                return _buildEventsMarker(date, events);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _buildEventsMarker(DateTime date, List<dynamic> events) {
    return Positioned(
      right: 20,
      bottom: 5,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 10000),
        child: Center(
          child: Text(
            '1000歩',
            style: const TextStyle().copyWith(
              color: Colors.black,
              fontSize: 11,
            ),
          ),
        ),
      ),
    );
  }
}
