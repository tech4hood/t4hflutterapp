import 'package:http/http.dart' as http;

const baseUrl = 'https://api.meetup.com/Tech4Hood-All-Things-Programming';

class API{

  //gets past events from meetup api
  static Future  getPastEvents(){
    var url = baseUrl + '/events?&sign=true&photo-host=public&page=20&desc=true&status=past';
    return http.get(url);
  }

  //get future events from meetup api
  static Future getFutureEvents(){
    var url = baseUrl + '/events?&sign=true&photo-host=public&page=20&desc=true';
    return http.get(url);
  }
}