import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:votesyncapp/vs_widgets/responsive_scale_widget.dart';

import '../vs_constants/vs_constants.dart';
import '../vs_screens/election_campaign_screen.dart';

class VoteWidget extends StatefulWidget {
  const VoteWidget({super.key});

  @override
  State<VoteWidget> createState() => _VoteWidgetState();
}

class _VoteWidgetState extends State<VoteWidget> {

  @override
  Widget build(BuildContext context) {

  
    return ResponsiveScaleWidget(
      screenToScaleWidget: GridView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return MaxWidthBox(
            maxWidth: 450,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      child: Text("D"),
                      radius: 50,
                    ),
                    const Text("Diana Jerry"),
                    const Text("Software Development"),
                    Text("100L"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        OutlinedButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const ElectionCampaignScreen(),));

                            },
                            style: ButtonStyle(
                                side: MaterialStateProperty.all(
                                    BorderSide(color: vsAccentColor))),
                            child: const Text(
                              "Campaign",
                              style: TextStyle(color: vsAccentColor),
                            )),
                       MaxWidthBox(
                         maxWidth: 100,
                         child: TextButton(
                              onPressed: () {
                                showUnSuccessfulVoteDialog();
                              },
                              style: ButtonStyle(
                                   backgroundColor: MaterialStateProperty.all(
                                     vsPrimaryColor
                                   )
                              ),
                              child: const Text(
                                "Vote",
                                style: TextStyle(
                                  color: Colors.white
                                ),

                              )),
                       )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        }, gridDelegate: ResponsiveBreakpoints.of(context).isTablet?const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2):
      ResponsiveBreakpoints.of(context).smallerOrEqualTo(MOBILE)?const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1):const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3)

      ),
    );
  }

  showSuccessfulVoteDialog(){
    return showDialog(
      context: context, builder: (context) {
      return AlertDialog(
        title: const Text("You have successfully voted for Diana Jerry",style: TextStyle(
          fontSize: vsBM
        ),),
        content: Image.asset(voteSuccessfullImage),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child: const Text("Ok"))
        ],
      );
    },);
  }

  showUnSuccessfulVoteDialog(){
    return showDialog(
      context: context, builder: (context) {
      return AlertDialog(
        title: const Text("You have successfully voted for Diana Jerry",style: TextStyle(
            fontSize: vsBM
        ),),
        content: Image.asset(voteUnSuccessfullImage),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child: const Text("Ok"))
        ],
      );
    },);
  }

  Widget s(){
    return ResponsiveRowColumn(
      layout:  ResponsiveBreakpoints.of(context).isDesktop?ResponsiveRowColumnType.ROW:ResponsiveRowColumnType.COLUMN,
      children: [
        ResponsiveRowColumnItem(
            child:Container(
           width: 10.w,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const CircleAvatar(
                        child: Text("D"),
                        radius: 50,
                      ),
                      const Text("Diana Jerry"),
                      const Text("Software Development"),
                      Text("100L"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          OutlinedButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const ElectionCampaignScreen(),));

                              },
                              style: ButtonStyle(
                                  side: MaterialStateProperty.all(
                                      BorderSide(color: vsAccentColor))),
                              child: const Text(
                                "Campaign",
                                style: TextStyle(color: vsAccentColor),
                              )),
                          TextButton(
                              onPressed: () {
                                showUnSuccessfulVoteDialog();
                              },
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      vsPrimaryColor
                                  )
                              ),
                              child: const Text(
                                "Vote",
                                style: TextStyle(
                                    color: Colors.white
                                ),

                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )

        ),
        ResponsiveRowColumnItem(
            child:Container(
              width: 10.w,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const CircleAvatar(
                        child: Text("D"),
                        radius: 50,
                      ),
                      const Text("Diana Jerry"),
                      const Text("Software Development"),
                      Text("100L"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          OutlinedButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const ElectionCampaignScreen(),));

                              },
                              style: ButtonStyle(
                                  side: MaterialStateProperty.all(
                                      BorderSide(color: vsAccentColor))),
                              child: const Text(
                                "Campaign",
                                style: TextStyle(color: vsAccentColor),
                              )),
                          TextButton(
                              onPressed: () {
                                showUnSuccessfulVoteDialog();
                              },
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      vsPrimaryColor
                                  )
                              ),
                              child: const Text(
                                "Vote",
                                style: TextStyle(
                                    color: Colors.white
                                ),

                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )

        ),
        ResponsiveRowColumnItem(
            child:Container(
              width: 10.w,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const CircleAvatar(
                        child: Text("D"),
                        radius: 50,
                      ),
                      const Text("Diana Jerry"),
                      const Text("Software Development"),
                      Text("100L"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          OutlinedButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const ElectionCampaignScreen(),));

                              },
                              style: ButtonStyle(
                                  side: MaterialStateProperty.all(
                                      BorderSide(color: vsAccentColor))),
                              child: const Text(
                                "Campaign",
                                style: TextStyle(color: vsAccentColor),
                              )),
                          TextButton(
                              onPressed: () {
                                showUnSuccessfulVoteDialog();
                              },
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      vsPrimaryColor
                                  )
                              ),
                              child: const Text(
                                "Vote",
                                style: TextStyle(
                                    color: Colors.white
                                ),

                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )

        ),


      ],
    );
  }
}
