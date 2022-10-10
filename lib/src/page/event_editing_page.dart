import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/models/event.dart';
import 'package:flutter_application_1/src/utils.dart';

class EventEditingPage extends StatefulWidget {
  final Event? event;
  EventEditingPage({this.event, super.key});
 



  @override
  State<EventEditingPage> createState() => _EventEditingPageState();
}


class _EventEditingPageState extends State<EventEditingPage> {
 final _formKey = GlobalKey<FormState>();
 final titleController = TextEditingController();
 late DateTime fromDate;
 late DateTime toDate;

  @override
 void initState() {
  super.initState();

  if (widget.event==null) {
    fromDate=DateTime.now();
    toDate = DateTime.now().add(const Duration(hours: 2));
  }
 }


  @override
  void dispose() {
    titleController.dispose();


    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    List<Widget> buildEditingActions() =>[
      ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        onPressed: () {},
        icon: const Icon(Icons.done),
        label: const Text('SAVE'),
      ),
    ];


  Widget buildTitle()=>TextFormField(
    style: const TextStyle(fontSize: 24),
    decoration: const InputDecoration(
      border: UnderlineInputBorder(),
      hintText: 'Add Title',
    ),
    onFieldSubmitted: (_) {},
    validator: (title)=>
    title !=null && title.isEmpty ? 'Title cannot be Empty' : null,
    controller: titleController,
  );


Widget buildDropdownField({
  required String text, 
  required VoidCallback onClicked,
})=>
    ListTile(
      title: Text(text),
      trailing: Icon(Icons.arrow_drop_down),
      onTap: onClicked,
    );

  Widget buildHeader({
    required String header,
    required Widget child,
  })=>
  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(header, style: TextStyle(fontWeight: FontWeight.bold)),
      child,
    ],
  );


Widget buildFrom() =>buildHeader(
  header: 'FROM',
  child:   Row(
  
    children: [
  
  Expanded(
  
    flex: 2,
  
    child: buildDropdownField(
  
      text: Utils.toDate(fromDate),
  
      onClicked: () {},
  
    ),
  
    ),
  
    Expanded(
  
      child: buildDropdownField(
  
        text: Utils.toTime(fromDate),
  
        onClicked: () {},
  
      ),
  
    ),
  
    ],
  
    ),
);



Widget buildTo() =>buildHeader(
  header: 'TO',
  child:   Row(
  
    children: [
  
  Expanded(
  
    flex: 2,
  
    child: buildDropdownField(
  
      text: Utils.toDate(toDate),
  
      onClicked: () {},
  
    ),
  
    ),
  
    Expanded(
  
      child: buildDropdownField(
  
        text: Utils.toTime(toDate),
  
        onClicked: () {},
  
      ),
  
    ),
  
    ],
  
    ),
);

Widget buildDateTimePickers() => Column(
    children: [
      buildFrom(),
      buildTo(),
    ],
  );




    return Scaffold(
      appBar:AppBar(
        leading: const CloseButton(),
        actions: buildEditingActions(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
           mainAxisSize: MainAxisSize.min,
           children: <Widget>[
            buildTitle(),
            SizedBox(height: 12),
            buildDateTimePickers(),
           ],
        ),
      ),
      ),
    );
  }
}