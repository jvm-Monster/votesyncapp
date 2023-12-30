import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:votesyncapp/vs_constants/vs_constants.dart';
import 'package:votesyncapp/vs_widgets/appbar_titile_widget.dart';
import 'package:votesyncapp/vs_widgets/responsive_scale_widget.dart';
import 'package:votesyncapp/vs_widgets/vote_screen_widget.dart';
import 'package:votesyncapp/vs_widgets/vs_appbar.dart';
import 'package:votesyncapp/vs_widgets/vs_searchbar_widget.dart';

class VoteScreen extends StatefulWidget {
  const VoteScreen({super.key});

  @override
  State<VoteScreen> createState() => _VoteScreenState();
}

class _VoteScreenState extends State<VoteScreen> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveScaleWidget(
      screenToScaleWidget: Scaffold(
          appBar: AppBar(
            title: const AppBarTitleWidget(title: "Ausa Presidential Election"),
            automaticallyImplyLeading: true,
          ),
          body: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VSSearchBarWidget(),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Your vote is secure,\nYour vote counts",style: TextStyle(
                  color: vsAccentColor,
                  fontSize: vsBL
                ),),
              ),
              Expanded(child: VoteWidget()),
            ],
          )
      ),
    );
  }
}
