import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:votesyncapp/vs_screens/election_posts_screen.dart';
import 'package:votesyncapp/vs_widgets/appbar_titile_widget.dart';
import 'package:votesyncapp/vs_widgets/responsive_scale_widget.dart';

import '../vs_constants/vs_constants.dart';

class ElectionCategoriesScreen extends StatelessWidget {
  const ElectionCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveScaleWidget(
      screenToScaleWidget: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: const AppBarTitleWidget(title: "Election Categories")
        ),

        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Vote or monitor election progress?"
                      "\nclick on any of the options",style: TextStyle(
                    color: vsAccentColor,
                    fontSize: vsBS,
                    fontWeight: FontWeight.bold
                  ),),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: 4,
                itemBuilder: (context, index) {
                 return GestureDetector(
                   child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(

                          children: [
                            const Text("Ausa Presidential Election",style: TextStyle(
                                fontSize: vsTM
                            ),),

                            const Text("Ausa Presidential Election",style: TextStyle(
                                fontSize: vsBS
                            ),),

                            Image.asset(ongoingElectionImage,width: 150,)
                          ],
                        ),
                      ),
                    ),
                   onTap: () {
                     Navigator.push(context, MaterialPageRoute(builder:(context) => const ElectionPostsScreen(), ));
                   },
                 );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
