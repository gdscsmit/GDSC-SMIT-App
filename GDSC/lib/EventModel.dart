import 'package:cloud_firestore/cloud_firestore.dart';
class Event
{
  Timestamp? date;
  String? name;
  String? image;
  String? details;
  String? link;
  String? venue;
  List? tags;
  Event(
  {
    this.date,
    this.name,
    this.image,
    this.details,
    this.link,
    this.venue,
    this.tags
  });
  factory Event.fromMap(snapshot)
  {
    return Event(
      date: snapshot['date'],
      name: snapshot['name'],
      image: snapshot['image'],
      details: snapshot['details'],
      link: snapshot['link'],
      venue: snapshot['venue'],
      tags: snapshot['tags'],
    );
  }

}