import 'package:apsensi_mobile/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:apsensi_mobile/core/models/calendar/calendar_model.dart';

class KalenderWidget extends StatefulWidget {
  final DateTime focusedDay;
  final List<GetHolidays> holidaysInMonth;
  final Set<DateTime> holidayDates;
  final void Function(DateTime) filterHolidaysByMonth;
  final bool Function(DateTime) isToday;
  final void Function(DateTime) onMonthChanged;

  const KalenderWidget({
    Key? key,
    required this.focusedDay,
    required this.holidaysInMonth,
    required this.holidayDates,
    required this.filterHolidaysByMonth,
    required this.isToday,
    required this.onMonthChanged,
  }) : super(key: key);

  @override
  State<KalenderWidget> createState() => _KalenderWidgetState();
}

class _KalenderWidgetState extends State<KalenderWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        titlekalender(),
        tableCalendar(),
        eventInMonth(),
      ],
    );
  }

  Widget titlekalender() {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Text(
        'Kalender',
        style: blackTextStyle.copyWith(
          fontSize: 18,
          fontWeight: bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget tableCalendar() {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 5,
            offset: const Offset(3, 3),
          ),
        ],
      ),
      child: TableCalendar(
        calendarBuilders: CalendarBuilders(
          defaultBuilder: (context, date, _) {
            if (widget.holidayDates.contains(date)) {
              return Container(
                margin: const EdgeInsets.all(5.0),
                child: Center(
                  child: Text(
                    date.day.toString(),
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              );
            } else if (widget.holidaysInMonth.any((holiday) => isSameDay(holiday.dateStart, date))) {
              return Container(
                margin: const EdgeInsets.all(5.0),
                child: Center(
                  child: Text(
                    date.day.toString(),
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              );
            } else if (date.weekday == DateTime.sunday || date.weekday == DateTime.saturday) {
              return Container(
                margin: const EdgeInsets.all(5.0),
                child: Center(
                  child: Text(
                    date.day.toString(),
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              );
            } else {
              return Container(
                margin: const EdgeInsets.all(5.0),
                child: Center(
                  child: Text(
                    date.day.toString(),
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              );
            }
          },
          todayBuilder: (context, day, focusedDay) {
            if (widget.isToday(day)) {
              return Container(
                margin: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: Center(
                  child: Text(
                    day.day.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              );
            } else {
              return null;
            }
          },
          dowBuilder: (context, day) {
            if (day.weekday == DateTime.sunday || day.weekday == DateTime.saturday) {
              final text = DateFormat.E().format(day);
              return Center(
                child: Text(
                  text,
                  style: const TextStyle(color: Colors.red),
                ),
              );
            } else {
              return Center(
                child: Text(
                  DateFormat.E().format(day),
                  style: const TextStyle(color: Colors.black),
                ),
              );
            }
          },
        ),
        headerStyle: const HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
        ),
        focusedDay: widget.focusedDay,
        firstDay: DateTime(2021, 01, 01),
        lastDay: DateTime(2030, 12, 31),
        onPageChanged: (newFocusedDay) {
          widget.onMonthChanged(newFocusedDay);
        },
      ),
    );
  }

  Widget eventInMonth() {
    final filteredHolidays = widget.holidaysInMonth.where((holiday) =>
        holiday.dateStart.year == widget.focusedDay.year &&
        holiday.dateStart.month == widget.focusedDay.month).toList();

    if (filteredHolidays.isEmpty) {
      return Container(
        margin: const EdgeInsets.only(top: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: whiteColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(3, 3),
            ),
          ],
        ),
        child: const Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('Tidak ada hari libur di bulan ini'),
          ),
        ),
      );
    } else {
      return Container(
        margin: const EdgeInsets.only(top: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: whiteColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(3, 3),
            ),
          ],
        ),
        child: DataTable(
          columns: const [
            DataColumn(label: Text('Tanggal')),
            DataColumn(label: Text('Hari Libur')),
          ],
          rows: filteredHolidays.map((holiday) {
            return DataRow(
              cells: [
                DataCell(Text(DateFormat('dd-MM-yyyy').format(holiday.dateStart))),
                DataCell(Text(holiday.information)),
              ],
            );
          }).toList(),
        ),
      );
    }
  }

  bool isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
}
