import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Teams extends StatefulWidget {
  const Teams({Key? key}) : super(key: key);

  @override
  State<Teams> createState() => _TeamsState();
}

class _TeamsState extends State<Teams> {
  final CollectionReference teams =
      FirebaseFirestore.instance.collection('Team');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        bottom: PreferredSize(preferredSize: const Size.fromHeight(4),
          child: Image.asset("assets/divider.png"),

        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "TEAMS",
              style: TextStyle(
                  color: Colors.grey[700],
                  letterSpacing: 2,
                  fontSize: 23,
                  fontFamily: "Vollkorn",
                  fontWeight: FontWeight.w900),
            ),
            GestureDetector(
              onDoubleTap: (){Navigator.pushNamed(context, "/credits");},
              child: Image.asset(
                "assets/gdsc-logo.png",
                height: 40,
                width: 40,
              ),
            ),
          ],
        ),
        toolbarHeight: 60,
        backgroundColor: Colors.white,
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bg.png"), fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(width: MediaQuery.of(context).size.width / 4),
                  GestureDetector(
                      onTap: () async {
                        var data = await teams
                            .doc("Lead")
                            .get()
                            .then((value) => value.data());
                        Navigator.pushNamed(context, "/details",
                            arguments: {"dep": "Lead", "data": data as Map});
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          //set border radius more than 50% of height and width to make circle
                        ),
                        elevation: 20,
                        margin: const EdgeInsets.all(20),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            children: [
                              Hero(
                                  tag: "Lead",
                                  child: Image.asset(
                                    "assets/recruitment.png",
                                    scale: 5,
                                  )),
                              const SizedBox(
                                width: 20,
                              ),
                              const Text("Lead",
                                  style: TextStyle(
                                      color: Colors.black,
                                      letterSpacing: 2,
                                      fontSize: 23,
                                      fontWeight: FontWeight.w900))
                            ],
                          ),
                        ),
                      ))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                      onTap: () async {
                        var data = await teams
                            .doc("AIDS")
                            .get()
                            .then((value) => value.data());
                        Navigator.pushNamed(context, "/details",
                            arguments: {"dep": "AI", "data": data as Map});
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          //set border radius more than 50% of height and width to make circle
                        ),
                        elevation: 20,
                        margin: const EdgeInsets.all(20),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            children: [
                              Hero(
                                  tag: "AI",
                                  child: Image.asset(
                                    "assets/artificial-intelligence.png",
                                    scale: 5,
                                  )),
                              const SizedBox(
                                width: 20,
                              ),
                              const Text(
                                  "Artificial\n Intelligence\n and\n Data Science",
                                  style: TextStyle(
                                      color: Colors.black,
                                      letterSpacing: 2,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w900,),textAlign: TextAlign.center,)
                            ],
                          ),
                        ),
                      )),
                  SizedBox(width: MediaQuery.of(context).size.width / 8),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(width: MediaQuery.of(context).size.width / 6),
                  GestureDetector(
                      onTap: () async {
                        var data = await teams
                            .doc("Cloud")
                            .get()
                            .then((value) => value.data());
                        Navigator.pushNamed(context, "/details",
                            arguments: {"dep": "Cloud", "data": data as Map});
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          //set border radius more than 50% of height and width to make circle
                        ),
                        elevation: 20,
                        margin: const EdgeInsets.all(20),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            children: [
                              Hero(
                                  tag: "Cloud",
                                  child: Image.asset(
                                    "assets/cloud-storage.png",
                                    scale: 5,
                                  )),
                              const SizedBox(
                                width: 20,
                              ),
                              const Text("Cloud\n Computing",
                                  style: TextStyle(
                                      color: Colors.black,
                                      letterSpacing: 2,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w900),textAlign: TextAlign.center,)
                            ],
                          ),
                        ),
                      )),

                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  GestureDetector(
                      onTap: () async {
                        var data = await teams
                            .doc("AppDev")
                            .get()
                            .then((value) => value.data());
                        Navigator.pushNamed(context, "/details",
                            arguments: {"dep": "App", "data": data as Map});
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          //set border radius more than 50% of height and width to make circle
                        ),
                        elevation: 20,
                        margin: const EdgeInsets.all(20),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            children: [
                              Hero(
                                  tag: "App",
                                  child: Image.asset(
                                    "assets/development.png",
                                    scale: 5,
                                  )),
                              const SizedBox(
                                width: 20,
                              ),
                              const Text("App\n Development",
                                  style: TextStyle(
                                      color: Colors.black,
                                      letterSpacing: 2,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w900),textAlign: TextAlign.center,)
                            ],
                          ),
                        ),
                      )),
                  SizedBox(width: MediaQuery.of(context).size.width / 7.2),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(width: MediaQuery.of(context).size.width / 6.4),
                  GestureDetector(
                      onTap: () async {
                        var data = await teams
                            .doc("WebDev")
                            .get()
                            .then((value) => value.data());
                        Navigator.pushNamed(context, "/details",
                            arguments: {"dep": "Web", "data": data as Map});
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          //set border radius more than 50% of height and width to make circle
                        ),
                        elevation: 20,
                        margin: const EdgeInsets.all(20),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            children: [
                              Hero(
                                  tag: "Web",
                                  child: Image.asset(
                                    "assets/app-development.png",
                                    scale: 5,
                                  )),
                              const SizedBox(
                                width: 20,
                              ),
                              const Text("Web\nDevelopment",
                                  style: TextStyle(
                                      color: Colors.black,
                                      letterSpacing: 2,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w900),textAlign: TextAlign.center,)
                            ],
                          ),
                        ),
                      ))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  GestureDetector(
                      onTap: () async {
                        var data = await teams
                            .doc("UIUX")
                            .get()
                            .then((value) => value.data());
                        Navigator.pushNamed(context, "/details",
                            arguments: {"dep": "UIUX", "data": data as Map});
                      },
                      child: Card(

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          //set border radius more than 50% of height and width to make circle
                        ),
                        elevation: 20,
                        margin: const EdgeInsets.all(20),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            children: [
                              Hero(
                                  tag: "UIUX",
                                  child: Image.asset(
                                    "assets/ui.png",
                                    scale: 5,
                                  )),
                              const SizedBox(
                                width: 20,
                              ),
                              const Text("UI/UX",
                                  style: TextStyle(
                                      color: Colors.black,
                                      letterSpacing: 2,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w900))
                            ],
                          ),
                        ),
                      )),
                  SizedBox(width: MediaQuery.of(context).size.width / 4),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(width: MediaQuery.of(context).size.width / 3.8),
                  GestureDetector(
                      onTap: () async {
                        var data = await teams
                            .doc("CyberSec")
                            .get()
                            .then((value) => value.data());
                        Navigator.pushNamed(context, "/details",
                            arguments: {"dep": "Cyber", "data": data as Map});
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          //set border radius more than 50% of height and width to make circle
                        ),
                        elevation: 20,
                        margin: const EdgeInsets.all(20),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            children: [
                              Hero(
                                  tag: "Cyber",
                                  child: Image.asset(
                                    "assets/hacker.png",
                                    scale: 5,
                                  )),
                              const SizedBox(
                                width: 20,
                              ),
                              const Text("Cyber\nSecurity",
                                  style: TextStyle(
                                      color: Colors.black,
                                      letterSpacing: 2,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w900))
                            ],
                          ),
                        ),
                      )),

                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  GestureDetector(
                      onTap: () async {
                        var data = await teams
                            .doc("Management")
                            .get()
                            .then((value) => value.data());
                        Navigator.pushNamed(context, "/details",
                            arguments: {"dep": "Management", "data": data as Map});
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          //set border radius more than 50% of height and width to make circle
                        ),
                        elevation: 20,
                        margin: const EdgeInsets.all(20),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            children: [
                              Hero(
                                  tag: "Management",
                                  child: Image.asset(
                                    "assets/team-management.png",
                                    scale: 5,
                                  )),
                              const SizedBox(
                                width: 20,
                              ),
                              const Text("Management",
                                  style: TextStyle(
                                      color: Colors.black,
                                      letterSpacing: 2,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w900))
                            ],
                          ),
                        ),
                      )),
                  SizedBox(width: MediaQuery.of(context).size.width / 7),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(width: MediaQuery.of(context).size.width / 4),
                  GestureDetector(

                      onTap: () async {
                        var data = await teams
                            .doc("Editorial")
                            .get()
                            .then((value) => value.data());
                        Navigator.pushNamed(context, "/details",
                            arguments: {"dep": "Editorial", "data": data as Map});
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          //set border radius more than 50% of height and width to make circle
                        ),
                        elevation: 20,
                        margin: const EdgeInsets.all(20),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            children: [
                              Hero(
                                  tag: "Editorial",
                                  child: Image.asset(
                                    "assets/magazine.png",
                                    scale: 5,
                                  )),
                              const SizedBox(
                                width: 20,
                              ),
                              const Text("Editorial",
                                  style: TextStyle(
                                      color: Colors.black,
                                      letterSpacing: 2,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w900))
                            ],
                          ),
                        ),
                      ))
                ],
              ),
              // Image.asset("assets/divider.png"),
              // const SizedBox(height: 20,),
              // Text("© 2022 GDSC SMIT",style:TextStyle(
              //     fontFamily: "Vollkorn",
              //     fontSize: 15,
              //     fontWeight: FontWeight.bold,
              //     color: Colors.grey.shade700),),
              const SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}
