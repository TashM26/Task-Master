import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:task_master/ui/theme/app_colors.dart';

class CustomCalendarPicker extends StatelessWidget {
  final DateTime firstDay;
  final DateTime lastDay;
  final DateTime focusedDay;
  final CalendarFormat calendarFormat;
  final Function(DateTime?, DateTime?) onDaySelected;
  final Function(CalendarFormat) onFormatChanged;
  final Function(DateTime) onPageChanged;
  final bool Function(DateTime?) selectedDayPredicate;

  const CustomCalendarPicker({
    required this.firstDay,
    required this.lastDay,
    required this.focusedDay,
    required this.calendarFormat,
    required this.onDaySelected,
    required this.onFormatChanged,
    required this.onPageChanged,
    required this.selectedDayPredicate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 4,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: AppColors.darkGrey,
      ),
      child: TableCalendar(
        firstDay: firstDay,
        lastDay: lastDay,
        focusedDay: focusedDay,
        calendarFormat: calendarFormat,
        headerStyle: const HeaderStyle(
          titleCentered: true,
          formatButtonVisible: false,
          titleTextStyle: TextStyle(
            color: Colors.white,
          ),
          leftChevronIcon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
          rightChevronIcon: Icon(
            Icons.arrow_forward_ios_rounded,
            color: Colors.white,
          ),
        ),
        daysOfWeekStyle: const DaysOfWeekStyle(
          weekdayStyle: TextStyle(
            color: Colors.white,
          ),
          weekendStyle: TextStyle(
            color: AppColors.red,
          ),
        ),
        calendarStyle: const CalendarStyle(
          weekendTextStyle: TextStyle(
            color: Colors.white,
          ),
          defaultTextStyle: TextStyle(
            color: Colors.white,
          ),
        ),
        pageAnimationCurve: Curves.bounceIn,
        selectedDayPredicate: selectedDayPredicate,
        onDaySelected: onDaySelected,
        onFormatChanged: onFormatChanged,
        onPageChanged: onPageChanged,
      ),
    );
  }
}