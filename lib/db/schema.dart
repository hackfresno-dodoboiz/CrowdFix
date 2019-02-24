import 'package:meta/meta.dart';

class Events {

  final String eventTitle;  
  final Map location;
  final String desc;
  final int likes;
  final int dislikes;
  final String img;
  final String category;
  Events({
    @required this.eventTitle,
    @required this.location,
    @required this.img,
    this.desc,
    this.likes,
    this.dislikes,
    this.category

  });

 Map<String, dynamic> toJson() =>
  {
    'event_title': eventTitle,
    'location': location,
    'desc' : desc,
    'likes': likes,
    'dislikes': dislikes,
    'img': img,
    'category':category


  };

}