
import 'package:flutter/material.dart';
import 'package:votesyncapp/vs_apis/school_api.dart';
import 'package:votesyncapp/vs_models/school_model.dart';
import 'package:votesyncapp/vs_screens/login_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:votesyncapp/vs_utils/load_request_on_open_app.dart';

import '../stateproviders/school_state_providers.dart';
import '../vs_constants/vs_constants.dart';

class LoadingScreen extends ConsumerStatefulWidget {
  const LoadingScreen({super.key});

  @override
  ConsumerState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends ConsumerState<LoadingScreen> {
  void getSchoolsData() async {
       await AppRequestsLoaderOnOpenApp.loadSchoolsData(ref);
       navigateToLoginScreen();
  }

  void navigateToLoginScreen(){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
  }

  @override
  void initState() {
    super.initState();

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
