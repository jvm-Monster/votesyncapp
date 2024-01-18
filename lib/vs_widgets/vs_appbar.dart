import 'package:flutter/material.dart';
import 'package:votesyncapp/vs_screens/election_posts_screen.dart';
import 'package:votesyncapp/vs_widgets/appbar_titile_widget.dart';

import '../vs_constants/vs_constants.dart';
import '../vs_screens/notification_screen.dart';

class VSAppBar extends StatelessWidget {
  const VSAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const AppBarTitleWidget(title: "Activities"),
      leading: IconButton(
          color: vsPrimaryColor,
          onPressed: () {
            keyState.currentState?.openDrawer();
          },
          icon: const Icon(Icons.list)),
      actions: [
        IconButton(
            color: vsPrimaryColor,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ElectionPostsScreen(),
                  ));
            },
            icon: const Icon(Icons.signpost)),
        Badge(
          label: const Text("1k",style: TextStyle(
              fontSize: vsBS-5,
            color: Colors.white
          ),),
          backgroundColor: const Color(0xFFFF0606),
          largeSize: 15,
          offset: const Offset(-7, 1),
          child: IconButton(
              color: vsPrimaryColor,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationScreen(),));
              },
              icon: const Icon(Icons.notifications_none_outlined,)),
        ),
        IconButton(
            color: vsPrimaryColor,
            onPressed: () {},
            icon: const Icon(Icons.bar_chart)),

      ],
    );
  }
}
