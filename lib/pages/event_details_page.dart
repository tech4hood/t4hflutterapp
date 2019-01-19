import 'package:flutter/material.dart';
import '../shared/utils.dart';

class EventDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
          backgroundColor: Utilities.blueOne,
          title: Text('Event details'),
        ),
        body:Center(
      child: Text('Some data here!'),
    )
    );
    
  }
}
