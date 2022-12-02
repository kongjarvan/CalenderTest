import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarTest extends StatefulWidget {
  const CalendarTest({Key? key}) : super(key: key);

  @override
  State<CalendarTest> createState() => _CalendarTestState();
}

class _CalendarTestState extends State<CalendarTest> {
  DateTime selectedDay = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 300,
          height: 500,
          child: TableCalendar(
            onHeaderTapped: (focusedDay) {},
            focusedDay: DateTime.now(),
            firstDay: DateTime.utc(2000, 1, 1),
            lastDay: DateTime.utc(2099, 12, 31),
            locale: 'ko-KR',
            daysOfWeekHeight: 30,
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
            ),
            calendarStyle: CalendarStyle(
              todayDecoration: BoxDecoration(color: Colors.transparent),
              todayTextStyle: TextStyle(color: Colors.black),
            ),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                focusedDay = selectedDay;
              });
              print(focusedDay);
              _buildDialog(context);
            },
          ),
        ),
      ),
    );
  }

  void _buildDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          titlePadding: EdgeInsets.only(left: 120, right: 120, top: 60),
          title: SizedBox(
            width: 300,
            child: Text(
              '이날 맞음?',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.deepOrange, fontSize: 32),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: 240,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: Colors.deepOrange),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Center(
                          child: Text(
                            '아니오',
                            style: TextStyle(
                              color: Colors.deepOrange,
                              fontSize: 20,
                              height: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: 240,
                      decoration: BoxDecoration(
                        color: Colors.deepOrange,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: Colors.deepOrange),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Center(
                          child: Text(
                            '네',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              height: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
