import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:task_master/domain/models/to_do.dart';
import 'package:task_master/generated/locale_keys.g.dart';
import 'package:task_master/ui/components/calendar_page_components/custom_calendar_picker.dart';
import 'package:task_master/ui/components/calendar_page_components/empty_to_do_date.dart';
import 'package:task_master/ui/components/calendar_page_components/picked_to_do_list_view.dart';
import 'package:task_master/ui/components/custom_app_bar/custom_app_bar.dart';
import 'package:task_master/ui/theme/app_colors.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  final user = FirebaseAuth.instance.currentUser;
  CalendarFormat _calendarFormat = CalendarFormat.twoWeeks;
  final DateTime _firstDate = DateTime.utc(2010, 10, 16);
  final DateTime _lastDate = DateTime.utc(2030, 3, 14);
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  String formatDateToSort({required String? selectedDay}) {
    if (selectedDay == null || selectedDay == 'null') {
      return '';
    } else {
      String selectedDay_day = _selectedDay.toString().substring(8, 10);
      String selectedDay_month = _selectedDay.toString().substring(5, 7);
      String selectedDay_year = _selectedDay.toString().substring(0, 4);
      String formatedSelectedDay =
          '${selectedDay_month}.${selectedDay_day}.${selectedDay_year}';
      return formatedSelectedDay;
    }
  }

  void _onDaySelected(selectedDay, focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
      });
    }
  }

  void _onFormatChanged(format) {
    if (_calendarFormat != format) {
      setState(() {
        _calendarFormat = format;
      });
    }
  }

  void _onPageChanged(focusedDay) {
    _focusedDay = focusedDay;
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.Bg,
      appBar: CustomAppBar(title: LocaleKeys.calendar.tr()),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: [
              CustomCalendarPicker(
                calendarFormat: _calendarFormat,
                firstDay: _firstDate,
                focusedDay: _focusedDay,
                lastDay: _lastDate,
                onDaySelected: _onDaySelected,
                onFormatChanged: _onFormatChanged,
                onPageChanged: _onPageChanged,
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay, day);
                },
              ),
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('${user?.uid} TO-DO\'S')
                    .where(
                      'sortDateTime',
                      isEqualTo: formatDateToSort(
                        selectedDay: _selectedDay.toString(),
                      ),
                    )
                    .snapshots(),
                builder: (context, snapshot) {
                  final getToDoS = snapshot.data?.docs;

                  final toDoList = getToDoS
                      ?.map(
                        (transaction) => ToDo.fromJson(
                          transaction.data(),
                        ),
                      )
                      .toList();
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Text('');
                  }
                  if (snapshot.hasData) {
                    if (_selectedDay != null) {
                      return PickedToDoListView(toDoList: toDoList);
                    }
                    return EmptyToDoDate(deviceSize: deviceSize);
                  }
                  return const Text('');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}


