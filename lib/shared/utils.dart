import 'package:flutter/material.dart';
import '../models/menu_item.dart';
import '../pages/events_page.dart';
import '../pages/social_media_page.dart';
import '../pages/our_apps_page.dart';
import '../pages/media_page.dart';

class Utilities {
  static List<Widget> menuWidgets(BuildContext context,List<MenuItemModel> menuItems) {
    return List<Widget>.generate(
      menuItems.length,
      (int index) => GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Utilities.getPageFromId(menuItems[index].id)),
            );
        },
        child: Container(
              color: menuItems[index].bgColor,
              padding: EdgeInsets.all(40.0),
              child: Column(
                children: <Widget>[
                    Image.asset('assets/' + menuItems[index].image, width: 40.0, height: 40.0, fit: BoxFit.contain),
                    Container(
                    margin: EdgeInsets.only(top: 10.0),
                    child: Text(menuItems[index].label, style: TextStyle(color: Colors.white)),
                  )
                ]
              ),
            )
      ),
    );
  }

  static StatefulWidget getPageFromId(String id) {

    StatefulWidget pageWidget;
    switch(id) {
      case 'events':
      pageWidget = EventsPage('Events');
      break;
      case 'social':
      pageWidget = SocialMediaPage('Social Media');
      break;
      case 'apps':
      pageWidget = OurAppsPage('Our Apps');
      break;
      case 'media':
      pageWidget = MediaPage( 'Media');
      break;
      case 'misc':
      pageWidget = EventsPage('Events');
      break;
    }

    return pageWidget;
  }
}