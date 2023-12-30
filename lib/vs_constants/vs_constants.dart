import 'package:flutter/material.dart';

//App Colors
const Color vsPrimaryColor = Color(0xFF3F51B5);//primary color
const Color vsSecondaryColor = Color(0xFF464555);//secondary Color
const Color vsAccentColor = Color(0XFFABA9BB);//accent color

//font sizes

// for HeadLine
const double vsHL= 40; //large
const double vsHLM= 35;//medium
const double vsHLS = 30;//small

//for title
const double vsTL=28;//large
const double vsTM=25;//medium

// for body
const double vsBL=20;//large
const double vsBM=18;//medium
const double vsBS=15;//small


//App fonts

TextTheme vsTextTheme= const TextTheme(
  //headLine font
  headlineLarge: TextStyle(
    fontSize: 40,
  ),

  headlineMedium: TextStyle(
    fontSize: 35
  ),

  headlineSmall: TextStyle(
    fontSize: 30
  ),

  //title font
  titleLarge: TextStyle(
    fontSize: 28
  ),

  titleMedium: TextStyle(
    fontSize: 25
  ),


  // body font
  bodyLarge: TextStyle(
    fontSize: 20
  ),

  bodyMedium: TextStyle(
    fontSize: 18
  ),

  bodySmall: TextStyle(
    fontSize: 15
  )

);


const Text appLogo=Text(
  "vs",
  style: TextStyle(
    color: vsPrimaryColor,
    fontSize: vsHLS,
    fontWeight: FontWeight.bold
  ),
);


// vsImages
const String vsCreateAccountImage="assets/images/createaccountimage.png";
const String vsLoginAccountImage = "assets/images/logintovoteimage.png";
const String ongoingElectionImage= "assets/images/ongoing_election_image.png";
const String voteSuccessfullImage= "assets/images/votesuccessful.png";
const String voteUnSuccessfullImage= "assets/images/voteunsuccessful.png";


const Map<String,Widget> electionStatus={
  "Ongoing": Card(
    child: CircleAvatar(
      radius: 5,
      backgroundColor:Color(0XFF1E88E5),
    ),
  ),

  "Pending": Card(
    child: CircleAvatar(
      radius: 5,
      backgroundColor:Color(0xFFEF5350),
    ),
  ),

  "Concluded": Card(
    child: CircleAvatar(
      radius: 5,
      backgroundColor:Color(0xFF43A047),
    ),
  ),
};


final keyState = GlobalKey<ScaffoldState>();



