import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';



class CalendarWidget extends StatelessWidget {
  const CalendarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SfCalendar(
    view: CalendarView.month,
    initialSelectedDate: DateTime.now(),
    cellBorderColor: Color.fromARGB(239, 179, 7, 188),
    );
  
  }
}