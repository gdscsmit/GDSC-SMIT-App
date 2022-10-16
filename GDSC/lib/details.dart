import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailedDep extends StatefulWidget {
  const DetailedDep({Key? key}) : super(key: key);

  @override
  State<DetailedDep> createState() => _DetailedDepState();
}

class _DetailedDepState extends State<DetailedDep> {
  Map<String, Map> depinfo = {
    "Lead": {
      "name": "LEAD",
      "img": "assets/recruitment.png",
      "document": "Lead"
    },
    "App": {
      "name": "App Development",
      "img": "assets/development.png",
      "document": "AppDev"
    },
    "Web": {
      "name": "WEB DEVELOPMENT",
      "img": "assets/app-development.png",
      "document": "WebDev"
    },
    "AI": {
      "name": "AI & DS",
      "img": "assets/artificial-intelligence.png",
      "document": "AIDS"
    },
    "Cloud": {
      "name": "CLOUD COMPUTING",
      "img": "assets/cloud-storage.png",
      "document": "Cloud"
    },
    "Cyber": {
      "name": "CYBER SECURITY",
      "img": "assets/hacker.png",
      "document": "CyberSec"
    },
    "UIUX": {"name": "UI UX", "img": "assets/ui.png", "document": "UIUX"},
    "Management": {
      "name": "MANAGEMENT",
      "img": "assets/team-management.png",
      "document": "Management"
    },
    "Editorial": {
      "name": "EDITORIAL",
      "img": "assets/magazine.png",
      "document": "Editorial"
    }
  };
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

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
    final dep = depinfo[args["dep"]]!;
    var depDetails = args["data"] as Map;

    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
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
              "TEAM",
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
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bg.png"), fit: BoxFit.cover),
            color: Colors.white,
          ),
        ),
        SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
                  child: Column(
                    children: [
                      const Text(
                        "Welcome to",
                        style: TextStyle(
                            fontFamily: "Vollkorn",
                            fontSize: 25,
                            color: Colors.indigo,
                            fontWeight: FontWeight.w100),
                      ),
                      Text(
                        dep["name"],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.indigo,
                            letterSpacing: 2,
                            fontFamily: "Vollkorn",
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Hero(
                  tag: args["dep"],
                  child: Image.asset(
                    dep["img"],
                    scale: 3,
                  ),
                ),
              ),
              Container(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 30),
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      //set border radius more than 50% of height and width to make circle
                    ),
                    child: Column(children: [
                      const SizedBox(
                        height: 20,
                      ),
                      depDetails["leadimg"] != ""
                          ? CircleAvatar(
                              child: const CircularProgressIndicator(),
                              radius: 100,
                              foregroundImage: NetworkImage(
                                depDetails["leadimg"],
                              ))
                          : const CircleAvatar(
                              radius: 100,
                              backgroundImage:
                                  AssetImage("assets/default.jpeg"),
                            ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        depDetails["lead"],
                        style: const TextStyle(
                            color: Colors.black,
                            letterSpacing: 2,
                            fontFamily: "Vollkorn",
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        "Lead",
                        style: TextStyle(
                            color: Colors.black,
                            letterSpacing: 2,
                            fontFamily: "Vollkorn",
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          depDetails["leadlinks"]["instagram"] != ""
                              ? GestureDetector(
                                  child: FaIcon(
                                    FontAwesomeIcons.instagram,
                                    size: 40,
                                    color: Colors.orange.shade900,
                                  ),
                                  onTap: () {
                                    _launchUrl(Uri.parse(
                                        depDetails["leadlinks"]["instagram"]));
                                  })
                              : const SizedBox(
                                  width: 0,
                                ),
                          const SizedBox(
                            width: 40,
                          ),
                          depDetails["leadlinks"]["github"] != ""
                              ? GestureDetector(
                                  child: FaIcon(
                                    FontAwesomeIcons.github,
                                    size: 40,
                                    color: Colors.grey.shade900,
                                  ),
                                  onTap: () {
                                    _launchUrl(Uri.parse(
                                        depDetails["leadlinks"]["github"]));
                                  })
                              : const SizedBox(
                                  width: 0,
                                ),
                          const SizedBox(
                            width: 40,
                          ),
                          depDetails["leadlinks"]["linkedin"] != ""
                              ? GestureDetector(
                                  child: const FaIcon(
                                    FontAwesomeIcons.linkedin,
                                    size: 40,
                                    color: Colors.blueAccent,
                                  ),
                                  onTap: () {
                                    _launchUrl(Uri.parse(
                                        depDetails["leadlinks"]["linkedin"]));
                                  })
                              : const SizedBox(
                                  width: 0,
                                ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ]),
                  )),
              depDetails["colead"] != ""
                  ? Container(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 30),
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        elevation: 20,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          //set border radius more than 50% of height and width to make circle
                        ),
                        child: Column(children: [
                          const SizedBox(
                            height: 20,
                          ),
                          depDetails["coleadimg"] != ""
                              ? CircleAvatar(
                                  radius: 100,
                                  foregroundImage: NetworkImage(
                                    depDetails["coleadimg"],
                                  ),
                                  child: const CircularProgressIndicator())
                              : const CircleAvatar(
                                  radius: 100,
                                  backgroundImage:
                                      AssetImage("assets/default.jpeg"),
                                ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            depDetails["colead"],
                            style: const TextStyle(
                                color: Colors.black,
                                letterSpacing: 2,
                                fontFamily: "Vollkorn",
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            "Co-Lead",
                            style: TextStyle(
                                color: Colors.black,
                                letterSpacing: 2,
                                fontFamily: "Vollkorn",
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              depDetails["coleadlinks"]["instagram"] != ""
                                  ? GestureDetector(
                                      child: FaIcon(
                                        FontAwesomeIcons.instagram,
                                        size: 40,
                                        color: Colors.orange.shade900,
                                      ),
                                      onTap: () {
                                        _launchUrl(Uri.parse(
                                            depDetails["coleadlinks"]
                                                ["instagram"]));
                                      })
                                  : const SizedBox(
                                      width: 0,
                                    ),
                              const SizedBox(
                                width: 40,
                              ),
                              depDetails["coleadlinks"]["github"] != ""
                                  ? GestureDetector(
                                      child: FaIcon(
                                        FontAwesomeIcons.github,
                                        size: 40,
                                        color: Colors.grey.shade900,
                                      ),
                                      onTap: () {
                                        _launchUrl(Uri.parse(
                                            depDetails["coleadlinks"]
                                                ["github"]));
                                      })
                                  : const SizedBox(
                                      width: 0,
                                    ),
                              const SizedBox(
                                width: 40,
                              ),
                              depDetails["coleadlinks"]["linkedin"] != ""
                                  ? GestureDetector(
                                      child: const FaIcon(
                                        FontAwesomeIcons.linkedin,
                                        size: 40,
                                        color: Colors.blueAccent,
                                      ),
                                      onTap: () {
                                        _launchUrl(Uri.parse(
                                            depDetails["coleadlinks"]
                                                ["linkedin"]));
                                      })
                                  : const SizedBox(
                                      width: 0,
                                    ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ]),
                      ))
                  : const SizedBox(
                      height: 0,
                    ),
              depDetails.keys.contains("extraTitle")
                  ? Container(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 30),
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        elevation: 20,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          //set border radius more than 50% of height and width to make circle
                        ),
                        child: Column(children: [
                          const SizedBox(
                            height: 20,
                          ),
                          depDetails["extraimg"] != ""
                              ? CircleAvatar(
                                  child: const CircularProgressIndicator(),
                                  radius: 100,
                                  foregroundImage: NetworkImage(
                                    depDetails["extraimg"],
                                  ))
                              : const CircleAvatar(
                                  radius: 100,
                                  backgroundImage:
                                      AssetImage("assets/default.jpeg"),
                                ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            depDetails["extraName"],
                            style: const TextStyle(
                                color: Colors.black,
                                letterSpacing: 2,
                                fontFamily: "Vollkorn",
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            depDetails["extraTitle"],
                            style: const TextStyle(
                                color: Colors.black,
                                letterSpacing: 2,
                                fontFamily: "Vollkorn",
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              depDetails["extralinks"]["instagram"] != ""
                                  ? GestureDetector(
                                      child: FaIcon(
                                        FontAwesomeIcons.instagram,
                                        size: 40,
                                        color: Colors.orange.shade900,
                                      ),
                                      onTap: () {
                                        _launchUrl(Uri.parse(
                                            depDetails["extralinks"]
                                                ["instagram"]));
                                      })
                                  : const SizedBox(
                                      width: 0,
                                    ),
                              const SizedBox(
                                width: 40,
                              ),
                              depDetails["extralinks"]["github"] != ""
                                  ? GestureDetector(
                                      child: FaIcon(
                                        FontAwesomeIcons.github,
                                        size: 40,
                                        color: Colors.grey.shade900,
                                      ),
                                      onTap: () {
                                        _launchUrl(Uri.parse(
                                            depDetails["extralinks"]
                                                ["github"]));
                                      })
                                  : const SizedBox(
                                      width: 0,
                                    ),
                              const SizedBox(
                                width: 40,
                              ),
                              depDetails["extralinks"]["linkedin"] != ""
                                  ? GestureDetector(
                                      child: const FaIcon(
                                        FontAwesomeIcons.linkedin,
                                        size: 40,
                                        color: Colors.blueAccent,
                                      ),
                                      onTap: () {
                                        _launchUrl(Uri.parse(
                                            depDetails["extralinks"]
                                                ["linkedin"]));
                                      })
                                  : const SizedBox(
                                      width: 0,
                                    ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ]),
                      ))
                  : const SizedBox(
                      height: 0,
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
      ]),
    );
  }
}
