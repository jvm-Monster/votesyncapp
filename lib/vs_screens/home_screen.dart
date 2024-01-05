import 'package:flutter/material.dart';
import 'package:votesyncapp/vs_constants/vs_constants.dart';
import 'package:votesyncapp/vs_widgets/activities_status_widget.dart';
import 'package:votesyncapp/vs_widgets/greeting_widget.dart';
import 'package:votesyncapp/vs_widgets/responsive_scale_widget.dart';
import 'package:votesyncapp/vs_widgets/vs_app_drawer.dart';
import 'package:votesyncapp/vs_widgets/vs_appbar.dart';
import 'package:votesyncapp/vs_widgets/vs_searchbar_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveScaleWidget(
      screenToScaleWidget: RefreshIndicator(
        onRefresh: () {
          return Future(() => "print");
        },
        triggerMode: RefreshIndicatorTriggerMode.onEdge,
        edgeOffset: 20,
        displacement: 200,
        strokeWidth: 5,
        color: Colors.yellow,
        child: Scaffold(
            key: keyState,
            appBar:  const PreferredSize(
              preferredSize: Size.fromHeight(50),
              child: VSAppBar(),
            ),
            body:  const Column(
              children: [
                 Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      VSSearchBarWidget(),
                       GreetingWidget(),
                    ],
                  ),
                ),

                SizedBox(height: 15),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: VSActivitiesStatus(),
                  ),
                ),
              ],
            ),
            drawer: const VSAppDrawer()),
      ),
    );
  }
}
