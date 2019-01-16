import 'package:flutter/material.dart';

class EventsPage extends StatefulWidget {

  final String title;

  EventsPage(this.title);

  @override
  _EventsPageState createState() =>  _EventsPageState();

}

class _EventsPageState extends State<EventsPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Color.fromARGB(255, 18, 20, 61),
          
        ),
        body:  ListView(
          shrinkWrap: true,
          children: <Text>[
            Text('hello World', style: TextStyle(color: Colors.black)),
          ]
        )
      );
  }
}