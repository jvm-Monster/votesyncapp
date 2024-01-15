import 'package:flutter/material.dart';
import 'package:votesyncapp/vs_widgets/appbar_titile_widget.dart';
import 'package:votesyncapp/vs_widgets/election_posts_card_widget.dart';
import 'package:votesyncapp/vs_widgets/filterby_widget.dart';
import 'package:votesyncapp/vs_widgets/responsive_scale_widget.dart';

import '../vs_widgets/election_dropdown_button_widget.dart';

class ElectionPostsScreen extends StatefulWidget {
  const ElectionPostsScreen({super.key});

  @override
  State<ElectionPostsScreen> createState() => _ElectionPostsScreenState();
}

class _ElectionPostsScreenState extends State<ElectionPostsScreen> {
  List<String> data = ["name","dsfsdj","sdfsdf"];
  String defaultValue = "name";
  @override
  Widget build(BuildContext context) {

     return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: const AppBarTitleWidget(title: "Ausa Election Posts"),

        ),
        body:Column(
          children: [
            FilterByWidget(),
            SizedBox(height: 15,),
            Expanded(child: ElectionPostCardWidgets())

          ],
        )
    );
  }
}
