
class Event extends Object{

  final name;
  final localDate;
  final localTime;
  final venueName;
  final venueAddress;
  final groupLocaltion;
  final venueCountry;
  final groupName;
  final description;

  Event({
    this.name,
    this.localDate,
    this.localTime,
    this.venueName,
    this.venueAddress,
    this.groupLocaltion,
    this.venueCountry,
    this.groupName,
    this.description
  });

  factory Event.fromJson(Map<String, dynamic> json){
    return Event(
      name: json['name'],
      localDate: json['local_date'],
      localTime: json['local_time'],
      venueName: json['venue']['name'],
      venueAddress: json['venue']['address_1'],
      groupLocaltion: json['group']['localized_location'],
      venueCountry: json['venue']['country'],
      groupName: json['group']['name'],
      description: ['description']

    );
  }
}