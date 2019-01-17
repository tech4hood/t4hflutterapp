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
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  //method that calls the past events
  List<Event> items = List<Event>();
  Future<String> fetchEvents() async {
    List<Event> events = List<Event>();
    var url =
        'https://api.meetup.com/Tech4Hood-All-Things-Programming/events?&sign=true&photo-host=public&page=20&desc=true&status=past';
    var response = await http.get(url);

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      var result = json.decode(response.body);
      // loop through array of items and assing to list
      for (int i = 0; i < result.length; i++) {
        events.add(Event.fromJson(result[i]));
      }

      setState(() {
        items = events;
      });

      return 'Success';
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  @override
  void initState() {
    super.initState();

    //call to fetch the data
    fetchEvents();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Utilities.blueOne,
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.calendar_today),
                text: 'Past events',
              ),
              Tab(icon: Icon(Icons.date_range), text: 'Future events'),
            ],
          ),
          title: Text(widget.title),
        ),
        body: TabBarView(
          children: [
            // tab 1 content
            ListView.builder(
              itemCount: items == null ? 0 : items.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Card(
                          child: Container(
                        child: Column(
                          children: <Widget>[
                            //TODO: this needs to be design, testing the data
                            Text(items[index].name),
                            Text(items[index].venueName),
                            Text(items[index].groupLocaltion)
        
                          ],
                        ),
                      ))
                    ],
                  ),
                );
                // By default, show a loading spinner
                //   return CircularProgressIndicator();
              },
            ),

            // tab 2 content
            Icon(Icons.date_range),
          ],
        ),
      ),
    );
  }
}
