import 'package:flutter/material.dart';
import 'package:votesyncapp/vs_constants/vs_constants.dart';
import 'package:votesyncapp/vs_widgets/appbar_titile_widget.dart';
import 'package:votesyncapp/vs_widgets/responsive_scale_widget.dart';
import 'package:votesyncapp/vs_widgets/vote_screen_widget.dart';
import 'package:votesyncapp/vs_widgets/voting_widget.dart';
import 'package:votesyncapp/vs_widgets/vs_searchbar_widget.dart';

class VoteScreen extends StatefulWidget {
  final String screenTitle;
  const VoteScreen({super.key,required this.screenTitle});

  @override
  State<VoteScreen> createState() => _VoteScreenState();
}

class _VoteScreenState extends State<VoteScreen> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
          appBar: AppBar(
            title: AppBarTitleWidget(title: widget.screenTitle),
            automaticallyImplyLeading: true,
          ),
          body: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VSSearchBarWidget(),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Vote securely,Your vote counts",style: TextStyle(
                  color: vsAccentColor,
                  fontSize: vsBL
                ),),
              ),
             /* Expanded(child: VoteWidget()),*/
              Expanded(child: VotingWidget())
            ],
          )
    );
  }
}
