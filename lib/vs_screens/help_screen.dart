import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:votesyncapp/vs_constants/vs_constants.dart';
import 'package:votesyncapp/vs_widgets/appbar_titile_widget.dart';
import 'package:votesyncapp/vs_widgets/help_widget.dart';
import 'package:votesyncapp/vs_widgets/responsive_scale_widget.dart';
import 'package:votesyncapp/vs_widgets/vs_searchbar_widget.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveScaleWidget(
      screenToScaleWidget: Scaffold(
        appBar: AppBar(
          title: const AppBarTitleWidget(title: "Help"),
        ),
        body: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Frequently Asked Questions"),
            ),
            SizedBox(
              height: 15,
            ),
            Divider(
              color: vsAccentColor,
            ),
            Expanded(child: HelpWidget())
          ],
        ),
      ),
    );
  }
}
