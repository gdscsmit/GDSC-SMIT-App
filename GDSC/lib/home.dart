import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:url_launcher/url_launcher.dart';
import 'events.dart';
import 'package:flutter/material.dart';
import 'EventModel.dart';
import 'notifications.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = false;
  List<Widget> upcominglist = [];
  List<Widget> pastlist = [];

  @override
  void initState() {
    super.initState();
    getEvents();
    FirebaseMessaging.instance.getInitialMessage().then(
      (message) {

      },
    );
    FirebaseMessaging.onMessage.listen(
      (message) {

        if (message.notification != null) {
          LocalNotificationService.createanddisplaynotification(message);
        }
      },
    );
    FirebaseMessaging.onMessageOpenedApp.listen(
      (message) {

      },
    );
  }

  void getEvents() async {
    setState(() {
      isLoading = true;
    });
    try {
      var upcoming =
          await FirebaseFirestore.instance.collection('Upcoming Events').get();
      upcominglist=[];
      pastlist=[];
      final upcomingData = upcoming.docs.map((doc) => doc.data());
      int k=0;
      for (var i in upcomingData) {
        Event event = Event.fromMap(i);
        Widget newEvent = EventDetails(i: event, j: "upcoming", k : k);
        upcominglist.add(newEvent);
        k++;
      }
      var past =
          await FirebaseFirestore.instance.collection('Past Events').get();
      final pastData = past.docs.map((doc) => doc.data());
      k=0;
      for (var i in pastData) {
        Event event = Event.fromMap(i);
        Widget newEvent = EventDetails(i: event, j: "past" , k : k);
        pastlist.add(newEvent);
        k++;
      }
    } catch (e) {
      print(e);
    }
    setState(() {
      isLoading = false;
    });
  }
  final EasyRefreshController _controller= EasyRefreshController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
              elevation: 10,
              bottom: PreferredSize(preferredSize: const Size.fromHeight(4),
              child: Image.asset("assets/divider.png"),
                
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onDoubleTap: () {
                      Navigator.pushNamed(context, "/credits");
                    },
                    child: Image.asset(
                      "assets/gdsc-logo.png",
                      height: 40,
                      width: 40,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Google Developers Student Clubs",
                        style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 15,
                            fontFamily: "Vollkorn",
                            fontWeight: FontWeight.normal

                        ),
                      ),
                      Text(
                        "Sikkim Manipal Institute of Technology",
                        style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 10,
                            fontFamily: "Vollkorn",
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ],
              ),
              toolbarHeight: 60,
              backgroundColor: Colors.white,
            ),
            body:EasyRefresh(
              noMoreRefresh: true,
              controller: _controller,
              header: const MaterialHeader(
                processedDuration: Duration(seconds: 0)
              ),
              onRefresh: () async {
                getEvents();
              },
              child:isLoading?Center(
                  child: SizedBox(
                    width: 40,
                    height: 40,
                    child: HeartbeatProgressIndicator(
                      child: Image.asset("assets/gdsc-logo.png",scale: 5,),
                    ),
                  ))
                  : Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/bg.png"), fit: BoxFit.cover)),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    const SizedBox(
                      height: 80,
                    ),

                    const Text(
                            'WELCOME TO GDSC SMIT',
                            style: TextStyle(
                              fontSize: 23.0,
                              fontFamily: 'Vollkorn',
                              fontWeight: FontWeight.bold
                            ),
                            textAlign: TextAlign.center,

                          ),


                    const SizedBox(
                      height: 50,
                    ),


                    ElevatedButton(onPressed: (){_launchUrl(Uri.parse(
                        "https://gdsc.community.dev/accounts/login/?next=/sikkim-manipal-institute-of-technology-gangtok/"
                    ));},
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 239, 83, 80))), child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Become a Member",style: TextStyle(
                          fontSize: 15.0,
                          fontFamily: 'Vollkorn',
                          fontWeight: FontWeight.normal
                      ),),
                    ),),
                    const SizedBox(
                      height: 50,
                    ),
                    const Center(
                      child: Text(
                        "Upcoming Events",
                        style: TextStyle(
                            fontSize: 25,
                            fontFamily: "Vollkorn",
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    upcominglist.isEmpty
                        ? Text(
                            "Events are Brewing. Stay Tuned...",
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: "Vollkorn",
                                fontWeight: FontWeight.w200,
                                color: Colors.grey.shade600),
                          )
                        : Column(
                            children: upcominglist,
                          ),
                    const SizedBox(
                      height: 30,
                    ),

                    const SizedBox(
                      height: 30,
                    ),
                    const Center(
                      child: Text(
                        "Past Events",
                        style: TextStyle(
                            fontSize: 25,
                            fontFamily: "Vollkorn",
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: pastlist.sublist(0, min(pastlist.length, 5)),
                    ),
                    // Image.asset("assets/divider.png"),
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    // Text(
                    //   "© 2022 GDSC SMIT",
                    //   style: TextStyle(
                    //       fontFamily: "Vollkorn",
                    //       fontSize: 15,
                    //       fontWeight: FontWeight.bold,
                    //       color: Colors.grey.shade700),
                    // ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ));
  }
  Future<void> _launchUrl(url) async {
    try {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } catch (e) {
      Fluttertoast.showToast(
          msg: "Please check your connection and Try again later.");
    }
  }
}
