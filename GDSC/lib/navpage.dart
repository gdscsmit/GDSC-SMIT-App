import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gdsc/about.dart';
import 'package:gdsc/home.dart';
import 'package:gdsc/teams.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({Key? key}) : super(key: key);

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List screen = [const HomeScreen(), const AboutScreen(), const Teams()];
  int i = 0;
  final List<TabItem> items = const [
    TabItem(
      icon: Icons.home,
      title: 'Home',
    ),
    TabItem(
      icon: Icons.info,
      title: 'About',
    ),
    TabItem(
      icon: Icons.people,
      title: 'Teams',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          await showDialog(
              context: context,
              builder: (val) => Dialog(
                    child: Container(
                      height: 180,
                      width: 300,
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                "assets/gdsc-logo.png",
                                height: 40,
                                width: 40,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                "Leaving so soon...",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontFamily: "Vollkorn",
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Text(
                            "Are you sure you want to exit the app?",
                            style: TextStyle(
                                color: Colors.grey[800],
                                fontSize: 15,
                                fontFamily: "Vollkorn",
                                fontWeight: FontWeight.w100),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(val);
                                  },
                                  child: const Text("Cancel",
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 15,
                                          fontFamily: "Vollkorn",
                                          fontWeight: FontWeight.normal))),
                              const SizedBox(
                                width: 60,
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(val);
                                  },
                                  child: const Text("No",
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 15,
                                          fontFamily: "Vollkorn",
                                          fontWeight: FontWeight.normal))),
                              TextButton(
                                  onPressed: () {
                                    SystemNavigator.pop();
                                  },
                                  child: const Text("Yes",
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 15,
                                          fontFamily: "Vollkorn",
                                          fontWeight: FontWeight.normal))),
                            ],
                          )
                        ],
                      ),
                    ),
                  ));
          return false;
        },
        child: Scaffold(
            body: screen[i],
            bottomNavigationBar: BottomBarDefault(
              iconSize: 25,
              indexSelected: i,
              items: items,
              backgroundColor: Colors.white,
              color: Colors.black,
              colorSelected: Colors.blue,
              onTap: (int index) => setState(() {
                i = index;
              }),
            )));
  }
}
