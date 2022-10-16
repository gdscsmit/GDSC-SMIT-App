

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:gdsc/credits.dart';
import 'package:gdsc/detailedevent.dart';
import 'package:gdsc/details.dart';
import 'package:gdsc/navpage.dart';
import 'notifications.dart';
import 'splashScreen.dart';
import 'teams.dart';
import 'home.dart';
import 'about.dart';
Future<void> backgroundHandler(RemoteMessage message) async {
  print(message.data.toString());
  print(message.notification!.title);
}

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  LocalNotificationService.initialize();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  runApp(MaterialApp(

      title: 'GDSC SMIT',
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) =>  SplashPage(),
        "/nav":(context)=> NavScreen(),
        "/home": (context) =>  HomeScreen(),
        "/about": (context) => AboutScreen(),
        "/splash":(context)=> const SplashPage(),
        "/teams":(context)=> const Teams(),
        "/event":(context)=> const DetailedEvent(),
        "/details":(context)=> const DetailedDep(),
        "/credits":(context)=> const CreditsScreen(),
      },
      theme: ThemeData(primaryColor: Colors.white,)
  )
  );
  }


