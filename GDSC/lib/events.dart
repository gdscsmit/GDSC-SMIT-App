import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'EventModel.dart';

class EventDetails extends StatelessWidget {
  final Event i;
  final String j;
  final int k;

  EventDetails({Key? key, required this.i, required this.j, required this.k})
      : super(key: key);
  final frames = [
    "yellowframe.png",
    "redframe.png",
    "blueframe.png",
    "greenframe.png"
  ];
  @override
  Widget build(BuildContext context) {
    Image? post = (i.image != null && i.image != "")
        ? Image.network(i.image!)
        : Image.network(
            "https://res.cloudinary.com/startup-grind/image/upload/c_fill,dpr_2,f_auto,g_center,q_auto:good/v1/gcs/platform-data-dsc/contentbuilder/GDG-Bevy-ChapterThumbnail.png",
          );
    final dateTime = i.date!.toDate();
    final date = DateFormat.yMMMMEEEEd().format(dateTime);
    final time = DateFormat.jm().format(dateTime);
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/event",
            arguments: {'event': i, 'type': j});
      },
      child: Container(
        margin: const EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/${frames[k % 4]}"),
                fit: BoxFit.fill)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hero(
                      tag: i.name!,
                      child: post,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      i.name!,
                      style: const TextStyle(
                          fontFamily: "Vollkorn",
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: Colors.black),
                    ),
                    Text(
                      "Date: $date",
                      style: const TextStyle(
                          fontFamily: "Vollkorn",
                          fontWeight: FontWeight.w200,
                          fontSize: 15,
                          color: Colors.black),
                    ),
                    j != "past"
                        ? Text(
                            "Time: $time",
                            style: const TextStyle(
                                fontFamily: "Vollkorn",
                                fontWeight: FontWeight.w200,
                                fontSize: 15,
                                color: Colors.black),
                          )
                        : const SizedBox(
                            height: 5,
                          ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
