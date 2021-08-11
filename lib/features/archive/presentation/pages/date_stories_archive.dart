import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class DateStoriesArchive extends StatefulWidget {
  @override
  _DateStoriesArchiveState createState() => _DateStoriesArchiveState();
}

class _DateStoriesArchiveState extends State<DateStoriesArchive> {
  var lastDayDateTime;
  var firstDayDateTime;

  @override
  void initState() {
    var now = new DateTime.now();

// Find the last day of the month.
    lastDayDateTime = (now.month < 12)
        ? new DateTime(now.year, now.month + 1, 0)
        : new DateTime(now.year + 1, 1, 0);
    firstDayDateTime = DateTime(now.year, now.month, 1);

    print(lastDayDateTime.day);
    print(firstDayDateTime.day);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    var _size = MediaQuery.of(context).size;
    return Container(
      width: _size.width,
      height: _size.height,
      padding: EdgeInsets.only(top: 50.0, left: 16.0, right: 16.0),
      child: Column(
        children: [
          TableCalendar(
            firstDay: firstDayDateTime,
            lastDay: lastDayDateTime,
            focusedDay: DateTime.now(),
            headerStyle: HeaderStyle(
              leftChevronVisible: false,
              rightChevronVisible: false,
              titleCentered: true,
              formatButtonVisible: false,
              titleTextStyle:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            daysOfWeekStyle: DaysOfWeekStyle(
              weekdayStyle: TextStyle(
                color: darkModeOn ? Colors.white : Colors.black,
              ),
              weekendStyle: TextStyle(
                color: darkModeOn ? Colors.white : Colors.black,
              ),
            ),
            rangeEndDay: DateTime.now(),
            rangeStartDay: firstDayDateTime,
            startingDayOfWeek: StartingDayOfWeek.monday,
            calendarStyle: CalendarStyle(
              defaultTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: darkModeOn ? Colors.white : Colors.grey.shade300),
              outsideDaysVisible: false,
              weekendTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: darkModeOn ? Colors.white : Colors.grey.shade300),
              rangeStartTextStyle:
                  TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
              withinRangeTextStyle:
                  TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
              rangeHighlightColor: Colors.transparent,
              rangeStartDecoration: null,
              rangeEndDecoration: null,
              rangeEndTextStyle:
                  TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
            ),
            //calendarBuilders: CalendarBuilders(),
          )
        ],
      ),
    );
  }
}
