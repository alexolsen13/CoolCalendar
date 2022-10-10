import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/page/event_editing_page.dart';
import 'package:flutter_application_1/src/screens/calendar_widget.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( MaterialApp(
    
    themeMode: ThemeMode.dark,
    darkTheme: ThemeData.dark().copyWith(
      scaffoldBackgroundColor: Colors.black,
      primaryColor: Colors.purple,
    ),
    home:MainPage())
    );
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: Text("Lehin Calendar"),
    centerTitle: true,
    ),
body: CalendarWidget(),
floatingActionButton: FloatingActionButton(
  child: Icon(Icons.add, color: Colors.white),
  backgroundColor: Colors.purple,
  onPressed: ()=>Navigator.of(context).push(
    MaterialPageRoute(builder: (context)=>EventEditingPage())
  ),
),
    );
  }
  }

