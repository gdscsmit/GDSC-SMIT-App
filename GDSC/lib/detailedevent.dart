import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gdsc/EventModel.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailedEvent extends StatefulWidget {
  const DetailedEvent({Key? key}) : super(key: key);

  @override
  State<DetailedEvent> createState() => _DetailedEventState();
}

class _DetailedEventState extends State<DetailedEvent> {
  Future<void> _launchUrl(url) async {
    try {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } catch (e) {
      Fluttertoast.showToast(
          msg: "Please check your connection and Try again later.");
    }
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    final Event event = args["event"];
    final type = args["type"];
    var formattedDetails = event.details!;
    final dateTime = event.date!.toDate();
    final date = DateFormat.yMMMMEEEEd().format(dateTime);
    final time = DateFormat.jm().format(dateTime);
    List<Widget> tags = [];
    for (var i in event.tags!) {
      if(i!="") {
        tags.add(
        Container(
          padding: const EdgeInsets.fromLTRB(10,5,10,5),
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Colors.grey[400],),
          child: Text(
            i!,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontFamily: "Vollkorn",
                fontWeight: FontWeight.w200),
          ),
        ),
      );
      }
    }
    formattedDetails = formattedDetails.replaceAll("\$", "\n");
    final venue=event.venue!.replaceAll("\$", "\n");
    return Scaffold(
        appBar: AppBar(
          elevation: 10,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(4),
            child: Image.asset("assets/divider.png"),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              size: 35,
            ),
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "EVENT",
                style: TextStyle(
                    color: Colors.grey[700],
                    letterSpacing: 2,
                    fontSize: 23,
                    fontFamily: "Vollkorn",
                    fontWeight: FontWeight.w900),
              ),
              Image.asset(
                "assets/gdsc-logo.png",
                height: 40,
                width: 40,
              )
            ],
          ),
          toolbarHeight: 60,
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/bg.png"), fit: BoxFit.cover)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Hero(
                  tag: event.name!,
                  child: Image.network(event.image!),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        event.name!,
                        style: const TextStyle(
                            color: Colors.black,
                            letterSpacing: 2,
                            fontSize: 23,
                            fontFamily: "Vollkorn",
                            fontWeight: FontWeight.w900),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.calendar_month,
                            color: Colors.blue,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            date,
                            style: const TextStyle(
                                color: Colors.blue,
                                fontSize: 15,
                                fontFamily: "Vollkorn",
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      type != "past"
                          ? Row(
                              children: [
                                const Icon(
                                  Icons.access_time_filled_sharp,
                                  color: Colors.blue,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  time,
                                  style: const TextStyle(
                                      color: Colors.blue,
                                      fontSize: 15,
                                      fontFamily: "Vollkorn",
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            )
                          : const SizedBox(
                              width: 0,
                            ),
                      event.venue != ""
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(Icons.location_on),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  venue,
                                  style: TextStyle(
                                      color: Colors.grey[700],
                                      fontSize: 15,
                                      fontFamily: "Vollkorn",
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            )
                          : const SizedBox(
                              width: 0,
                            ),
                      const SizedBox(
                        height: 10,
                      ),
                      event.details != ""
                          ? Text(
                              "About",
                              style: TextStyle(
                                  color: Colors.grey[900],
                                  fontSize: 20,
                                  fontFamily: "Vollkorn",
                                  fontWeight: FontWeight.w500),
                            )
                          : const SizedBox(
                              height: 50,
                            ),
                      Text(
                        formattedDetails,
                        style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 15,
                            fontFamily: "Vollkorn",
                            fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        children: tags,
                      ),
                      const SizedBox(height: 20,),
                      Center(
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(const Color.fromARGB(255, 239, 83, 80))),
                          onPressed: () {
                            if (event.link != null) {
                              _launchUrl(Uri.parse(event.link!));
                            }
                          },
                          child: type == "past"
                              ? const Text(
                                  "Click To Know More",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontFamily: "Vollkorn",
                                      fontWeight: FontWeight.w400),
                                )
                              : const Text(
                                  "RSVP NOW!",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontFamily: "Vollkorn",
                                      fontWeight: FontWeight.w400),
                                ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
                // Image.asset("assets/divider.png"),
                // Text(
                //   "© 2022 GDSC SMIT",
                //   style: TextStyle(
                //       fontFamily: "Vollkorn",
                //       fontSize: 15,
                //       fontWeight: FontWeight.bold,
                //       color: Colors.grey.shade700),
                // ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ));
  }
}
