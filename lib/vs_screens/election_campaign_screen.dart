import 'package:flutter/material.dart';
import 'package:votesyncapp/vs_constants/vs_constants.dart';
import 'package:votesyncapp/vs_widgets/appbar_titile_widget.dart';
import 'package:votesyncapp/vs_widgets/responsive_scale_widget.dart';

class ElectionCampaignScreen extends StatefulWidget {
  const ElectionCampaignScreen({super.key});

  @override
  State<ElectionCampaignScreen> createState() => _ElectionCampaignScreenState();
}

class _ElectionCampaignScreenState extends State<ElectionCampaignScreen> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveScaleWidget(
      screenToScaleWidget:Scaffold(
        appBar: AppBar(
          title: const AppBarTitleWidget(title: "Campaign Promises")
        ),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Vote Diana Jerry"),
                ],
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("for"),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Adeleke Ausa President"),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(radius: 50, child:Image.asset(ongoingElectionImage)),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.05,
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Diana Jerry",style: TextStyle(
                            fontSize: vsBM,

                        ),),
                        Text("Software Developer",style: TextStyle(
                            fontSize: vsBS,

                        ),),
                        Text("100L",style: TextStyle(
                            fontSize: vsBS,

                        ),),
                        SizedBox(
                          height: 15,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("-Vote for me and I\nwill be your voice-",style: TextStyle(
                                fontSize: vsBS,
                                color: vsAccentColor
                            ),),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),

            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width*1,

                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)
                  ),
                  color: vsSecondaryColor,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text("Campaign Title",style: TextStyle(color: Colors.white,fontSize: vsTL),),
                        SizedBox(height: 15,),
                        Text("My nam is lorem ipsum i am from lorem ipsum and i dont know my name ipsum, but for now, "
                    "you can call me lorem ipusm but i dont know just lsfsd see many a dsi sds ad d and i promise sdfsdf "
                    "My nam is lorem ipsum i am from lorem ipsum and i dont know my name ipsum, but for now, you can call me "
                            "lorem ipusm but i dont know just lsfsd see many a dsi sds ad d and i promise sdfsdf My nam is lorem ipsum "
                            "i am from lorem ipsum and i dont know my name ipsum, but for now, you can call me lorem ipusm but i dont know just "
                            "lsfsd see many a dsi sds ad d and i promise sdfsdf",
                          style: TextStyle(color: Colors.white,fontSize: vsBS),),


                      ],
                    ),
                  ),
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}
