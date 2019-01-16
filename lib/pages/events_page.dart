import 'package:flutter/material.dart';
import '../shared/utils.dart';
import '../models/event.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class EventsPage extends StatefulWidget {

  final String title;

  EventsPage(this.title);

  @override
  _EventsPageState createState() =>  _EventsPageState();

}


class _EventsPageState extends State<EventsPage> {

  
  //method that calls the past events
  Future<Event> fetchEvents() async{
    final response =
      await http.get('https://api.meetup.com/Tech4Hood-All-Things-Programming/events?&sign=true&photo-host=public&page=20&desc=true&status=past');

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON
    return Event.fromJson(json.decode(response.body));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
  }

  final Future<Event> items;
  
  @override
    void initState() {
      super.initState();

      List<Event> item = fetchEvents();

    }


  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Utilities.blueOne,
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.calendar_today),text: 'Past events',),
                Tab(icon: Icon(Icons.date_range), text: 'Future events'),
              ],
            ),
            title: Text(widget.title),
          ),
          body: TabBarView(
            children: [
              // tab 1 content
              // ListView.builder(
              //   itemCount: items.length,
              //   itemBuilder: (context, index) {
              //     return ListTile(
              //       title: Text('${items[index]}'),
              //     );,

              // tab 2 content
              Icon(Icons.date_range),
            ],
          ),
        ),
      );
  }
}