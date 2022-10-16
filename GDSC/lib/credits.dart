import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CreditsScreen extends StatelessWidget {
  const CreditsScreen({Key? key}) : super(key: key);
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
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back,size: 35,),
            color: Colors.black,
            onPressed: (){Navigator.pop(context);},
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Credits",
                style: TextStyle(
                    color: Colors.grey[700],
                    letterSpacing: 2,
                    fontFamily: "Vollkorn",
                    fontSize: 23,
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
        body: Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/bg.png"), fit: BoxFit.fill)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                    width: MediaQuery.of(context).size.width,
                    child:Card(
                  elevation: 20,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    //set border radius more than 50% of height and width to make circle
                  ),
                  child: Column(children:  [
                    const SizedBox(height: 20,),
                    const Text(
                      "Developer",
                      style: TextStyle(
                          color: Colors.black,
                          letterSpacing: 2,
                          fontFamily: "Vollkorn",
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20,),
                    const CircleAvatar(
                        radius: 100,
                        foregroundImage: NetworkImage(
                          "https://firebasestorage.googleapis.com/v0/b/gdsc-68402.appspot.com/o/leads%2FAryan_Lohia%20-%20Aryan%20Lohia.jpg?alt=media&token=ed974af1-f4df-442f-a735-703747e0db10",
                        ),
                        child: CircularProgressIndicator()),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Aryan Lohia",
                      style: TextStyle(
                          color: Colors.black,
                          letterSpacing: 2,
                          fontFamily: "Vollkorn",
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "App Development Co-Lead",
                      style: TextStyle(
                          color: Colors.black,
                          letterSpacing: 2,
                          fontFamily: "Vollkorn",
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                            child: FaIcon(
                              FontAwesomeIcons.instagram,
                              size: 40,
                              color: Colors.orange.shade900,
                            ),
                            onTap: () {
                              _launchUrl(Uri.parse(
                                  "https://www.instagram.com/aryanlohiaxd/"));
                            }),
                        
                        GestureDetector(
                            child: FaIcon(
                              FontAwesomeIcons.github,
                              size: 40,
                              color: Colors.grey.shade900,
                            ),
                            onTap: () {
                              _launchUrl(Uri.parse(
                                  "https://github.com/Aryan-Lohia"));
                            }),
                        GestureDetector(
                            child: const FaIcon(
                              FontAwesomeIcons.linkedin,
                              size: 40,
                              color: Colors.blueAccent,
                            ),
                            onTap: () {
                              _launchUrl(Uri.parse(
                                  "https://www.linkedin.com/in/aryan-lohia/"));
                            }),

                      ],
                    ),
                    const SizedBox(height: 20,),
                  ]),
                )),
                Container(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                    width: MediaQuery.of(context).size.width,
                    child:Card(
                      elevation: 20,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        //set border radius more than 50% of height and width to make circle
                      ),
                      child: Column(
                          children:  [
                        const SizedBox(height: 20,),
                        const Text(
                          "UI/UX",
                          style: TextStyle(
                              color: Colors.black,
                              letterSpacing: 2,
                              fontFamily: "Vollkorn",
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 20,),
                        const CircleAvatar(
                            radius: 100,
                            foregroundImage: NetworkImage(
                            "https://firebasestorage.googleapis.com/v0/b/gdsc-68402.appspot.com/o/leads%2FIMG_20221011_000927.jpg?alt=media&token=58a21696-9711-4682-9be4-755b2f096931"
                            ),
                            child: CircularProgressIndicator()),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Divyadrishti Chhetri",
                          style: TextStyle(
                              color: Colors.black,
                              letterSpacing: 2,
                              fontFamily: "Vollkorn",
                              fontSize: 30,
                              fontWeight: FontWeight.bold),textAlign: TextAlign.center,
                        ),
                        const Text(
                          "UI/UX Lead",
                          style: TextStyle(
                              color: Colors.black,
                              letterSpacing: 2,
                              fontFamily: "Vollkorn",
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                                child: FaIcon(
                                  FontAwesomeIcons.instagram,
                                  size: 40,
                                  color: Colors.orange.shade900,
                                ),
                                onTap: () {
                                  _launchUrl(Uri.parse(
                                      "https://www.instagram.com/divsct/"));
                                }),

                            GestureDetector(
                                child: const FaIcon(
                                  FontAwesomeIcons.linkedin,
                                  size: 40,
                                  color: Colors.blueAccent,
                                ),
                                onTap: () {
                                  _launchUrl(Uri.parse(
                                      "https://www.linkedin.com/in/divyadrishti-chhetri-259b2a215"));
                                }),

                          ],
                        ),
                        const SizedBox(height: 20,),
                      ]),
                    )),
                const SizedBox(height: 20,),
                // Image.asset("assets/divider.png"),
                // SizedBox(height: 20,),
                // Text("© 2022 GDSC SMIT",style:TextStyle(
                //     fontFamily: "Vollkorn",
                //     fontSize: 15,
                //     fontWeight: FontWeight.bold,
                //     color: Colors.grey.shade700),),
                // SizedBox(height: 20,),
              ],
            ),
          ),
        ));
  }
}
