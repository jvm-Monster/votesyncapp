import 'dart:async';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:votesyncapp/vs_apis/school_api.dart';
import 'package:votesyncapp/vs_models/school_model.dart';
import 'package:votesyncapp/vs_screens/login_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../stateproviders/school_state_providers.dart';
import '../vs_constants/vs_constants.dart';

class LoadingScreen extends ConsumerStatefulWidget {
  const LoadingScreen({super.key});

  @override
  ConsumerState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends ConsumerState<LoadingScreen> {
  late BuildContext _context; // Declare a variable to hold the context

  void getSchoolsData() async {


    List<School>? schools = await SchoolApi.getSchools();
    if (schools != null || schools!.isEmpty) {
      ref.read(schoolListProvider.notifier).update((state) => schools);
      // Use the captured context variable here
      Navigator.pushReplacement(_context, MaterialPageRoute(builder: (context) => LoginScreen()));
    }else{

    }
  }

  @override
  void initState() {
    super.initState();
    // Assign the context to the variable when the widget is initialized
    _context = context;
    getSchoolsData();
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            appLogo,
            LoadingAnimationWidget.horizontalRotatingDots(
              color: vsPrimaryColor,
              size: 30,
            ),
          ],
        ),
      ),
    );
  }




}
