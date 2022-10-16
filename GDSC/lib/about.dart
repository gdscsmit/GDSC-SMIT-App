import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 10,
        bottom: PreferredSize(preferredSize: const Size.fromHeight(4),
          child: Image.asset("assets/divider.png"),

        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "ABOUT US",
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(
                height: 30,
              ),
              // Card(
              //
              //   elevation: 0,
              //   child:
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,20,0,20),
                  child: Center(
                    child: Image.asset(
                      "assets/gdsc_smitwhite-transparent.png",
                      fit: BoxFit.cover,
                      height: 150,
                    ),
                  ),
                ),
              //),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 8, 10),
                child: Text("What is GDSC?",
                    style: TextStyle(
                        fontSize: 35,
                        fontFamily: "Vollkorn",
                        fontWeight: FontWeight.w800,
                        color: Colors.black)),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: Card(
                  elevation: 20,
                  margin: const EdgeInsets.fromLTRB(4, 10, 4, 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    //set border radius more than 50% of height and width to make circle
                  ),
                  color: Colors.white,
                  child:
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        SizedBox(
                          height: 10,
                        ),

                        Padding(
                          padding: EdgeInsets.fromLTRB(8, 0, 0, 10),
                          child: Text(
                            "Google Developer Student Clubs (GDSC) are community groups for college and university students interested in Google developer technologies. Students from all undergraduate or graduate programs with an interest in growing as a developer are welcome. By joining a GDSC, students grow their knowledge in a peer-to-peer learning environment and build solutions for local businesses and their community.",
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: "Vollkorn",
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Card(
              //   color: Colors.white,
              //   shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(10),
              //     //set border radius more than 50% of height and width to make circle
              //   ),
              //   child:
                Padding(
                  padding: const EdgeInsets.fromLTRB(15,20,15,15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:  [
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const CircleAvatar(
                            backgroundColor: Colors.blue,
                            radius: 30,
                            child: Icon(
                              Icons.people,
                              color: Colors.white,
                              size: 35,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Connect",
                                style: TextStyle(
                                    fontFamily: "Vollkorn",
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0,8,0,0),
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width/1.5,
                                  child: const Text(
                                    "Meet students interested in developer technologies at your university. All are welcome, including those with diverse backgrounds and different majors.",
                                    style: TextStyle(fontFamily: "Vollkorn"),
                                  ),
                                ),
                              ),

                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const CircleAvatar(
                            backgroundColor: Colors.blue,
                            radius: 30,
                            child: Icon(
                              Icons.lightbulb,
                              color: Colors.white,
                              size: 35,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Learn",
                                style: TextStyle(
                                    fontFamily: "Vollkorn",
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0,8,0,0),
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width/1.5,
                                  child: const Text(
                                    "Learn about a range of technical topics and gain new skills through hands-on workshops, events, talks, and project-building activities - both online and in-person.",
                                    style: TextStyle(fontFamily: "Vollkorn"),
                                  ),
                                ),
                              ),

                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const CircleAvatar(
                            backgroundColor: Colors.blue,
                            radius: 30,
                            child: Icon(
                              Icons.military_tech,
                              color: Colors.white,
                              size: 35,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Grow",
                                style: TextStyle(
                                    fontFamily: "Vollkorn",
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0,8,0,0),
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width/1.5,
                                  child: const Text(
                                    "Apply new learnings to build great solutions for local problems. Advance your skills, career, and network. Give back to your community by helping others learn, too.",
                                    style: TextStyle(fontFamily: "Vollkorn"),
                                  ),
                                ),
                              ),

                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
             // ),
             //  Padding(
             //    padding: const EdgeInsets.fromLTRB(8,0,8,0),
             //    child: Card(
             //        margin: const EdgeInsets.fromLTRB(4, 10, 4, 10),
             //      shape: RoundedRectangleBorder(
             //        borderRadius: BorderRadius.circular(10),
             //        //set border radius more than 50% of height and width to make circle
             //      ),
             //        child:
                    Padding(
                          padding: const EdgeInsets.fromLTRB(30,30,0,10),
                          child:
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                            Text(
                              "Domains under GDSC SMIT:",
                              style: TextStyle(
                                  fontFamily: "Vollkorn",
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 15,),
                            Text(
                              "     - AI & DS",
                              style: TextStyle(
                                  fontFamily: "Vollkorn",
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black),
                            ),
                            Text(
                              "     - Cloud Computing",
                              style: TextStyle(
                                  fontFamily: "Vollkorn",
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black),
                            ),Text(
                              "     - App Development",
                              style: TextStyle(
                                  fontFamily: "Vollkorn",
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black),
                            ),Text(
                              "     - Web Development",
                              style: TextStyle(
                                  fontFamily: "Vollkorn",
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black),
                            ),Text(
                              "     - UI/UX",
                              style: TextStyle(
                                  fontFamily: "Vollkorn",
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black),
                            ),Text(
                              "     - Cyber Security",
                              style: TextStyle(
                                  fontFamily: "Vollkorn",
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black),
                            ),Text(
                              "     - Management",
                              style: TextStyle(
                                  fontFamily: "Vollkorn",
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black),
                            ),Text(
                              "     - Editorial",
                              style: TextStyle(
                                  fontFamily: "Vollkorn",
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black),
                            ),
                          ])),

        //),
          //    ),
              const SizedBox(
                height: 10,
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(8,0,8,0),
                child: Card(
                    margin: const EdgeInsets.fromLTRB(4, 10, 4, 10),
                    color: Colors.white,
                    elevation: 20,
                  child:
                    Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Contact Us",
                              style: TextStyle(
                                  fontFamily: "Vollkorn",
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade700),
                            ),
                            // const SizedBox(
                            //   height: 5,
                            // ),
                            // GestureDetector(
                            //     child: Image.asset("assets/gdsc-logo.png",height: 50,width: 50,),
                            //     onTap: () {
                            //       _launchUrl(Uri.parse(
                            //           "https://gdscsmit.github.io/"));
                            //     }),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  child: Image.asset("assets/facebook.png",height: 50,width: 50,),
                                  onTap: () {
                                    _launchUrl(Uri.parse(
                                      "fb://page/103052022124517"
                                        ));
                                  },
                                ),
                                GestureDetector(
                                    child: Image.asset("assets/instagram.png",height: 60,width: 60,),
                                    onTap: () {
                                      _launchUrl(Uri.parse(
                                          "https://www.instagram.com/gdscsmit/"));
                                    }),

                                GestureDetector(
                                    child: FaIcon(
                                      FontAwesomeIcons.github,
                                      color: Colors.grey[800],
                                      size: 50,
                                    ),
                                    onTap: () {
                                      _launchUrl(Uri.parse(
                                          "https://github.com/gdscsmit"));
                                    }),
                                GestureDetector(
                                    child: Image.asset("assets/twitter.png",height: 50,width: 50,),
                                    onTap: () {
                                      _launchUrl(Uri.parse(
                                          "https://twitter.com/GdscSmit"));
                                    }),
                                GestureDetector(
                                    child: Image.asset("assets/linkedin.png",height: 50,width: 50,),
                                    onTap: () {
                                      _launchUrl(Uri.parse(
                                          "https://www.linkedin.com/company/gdscsmit"));
                                    })
                              ],
                            ),
                          ],
                        )),
        ),
              ),
        //       Image.asset("assets/divider.png"),
        //       const SizedBox(height: 20,),
        //       Text("© 2022 GDSC SMIT",style:TextStyle(
        //           fontFamily: "Vollkorn",
        //           fontSize: 15,
        //           fontWeight: FontWeight.bold,
        //           color: Colors.grey.shade700),),
        //     const SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}
