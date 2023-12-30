import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:votesyncapp/vs_widgets/appbar_titile_widget.dart';
import 'package:votesyncapp/vs_widgets/notification_widget.dart';
import 'package:votesyncapp/vs_widgets/responsive_scale_widget.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveScaleWidget(
      screenToScaleWidget: Scaffold(
        appBar:AppBar(
          title:const AppBarTitleWidget(title: "Notifications") ,
        ),
        body: const NotificationWidget(),
      ),
    );
  }
}
