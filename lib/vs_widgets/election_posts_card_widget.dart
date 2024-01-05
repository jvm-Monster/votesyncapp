import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:votesyncapp/stateproviders/election_state_notifier.dart';
import 'package:votesyncapp/vs_models/election_model.dart';
import 'package:votesyncapp/vs_screens/vote_screen.dart';

import '../vs_constants/vs_constants.dart';

class ElectionPostCardWidgets extends StatefulWidget {
  const ElectionPostCardWidgets({super.key});

  @override
  State<ElectionPostCardWidgets> createState() => _ElectionPostCardWidgetsState();
}

class _ElectionPostCardWidgetsState extends State<ElectionPostCardWidgets> {
  @override
  Widget build(BuildContext context) {
    if(ResponsiveBreakpoints.of(context).largerOrEqualTo(DESKTOP)){
      return  Consumer(
        builder: (context, ref, child) {
          final getElectionsData = ref.watch(electionListProvider);
          return GridView.builder(
          gridDelegate: ResponsiveBreakpoints.of(context).isTablet?const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2):
          ResponsiveBreakpoints.of(context).smallerOrEqualTo(MOBILE)?const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1):const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemCount: getElectionsData.length,
          itemBuilder: (context, index) {
            return  SizedBox(
                child: cardData(getElectionsData[index]));
          },
        );
        },
        
      );
    }else{
      return  Consumer(

        builder: (context, ref, child) {
          final getElectionsData = ref.watch(electionListProvider);
         return ListView.builder(
          itemCount: getElectionsData.length,
          itemBuilder: (context, index) {
            return  cardData(getElectionsData[index]);
          },
        );
        },
         
      );
    }



  }

  Widget cardData(Election election){
    return  Card(
      child:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(election.electionName,style: const TextStyle(
                        fontSize: vsTM,
                        fontWeight: FontWeight.bold
                    ),),

                    Row(
                      children: [
                        electionStatus["Ongoing"]!,
                        const Text("Ongoing",style: TextStyle(
                            fontSize: vsBS
                        ),)
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    const Text("Candidates"),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.05,
                    ),
                    const Text("4")
                  ],
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const VoteScreen(),));
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            vsPrimaryColor
                        )
                    ),
                    child: const Text("View",style: TextStyle(
                        color: Colors.white
                    ),)),
                TextButton(onPressed: (){
                }, child: const Row(
                  children: [
                    Text("See result",
                      style: TextStyle(
                          color: vsAccentColor
                      ),
                    ),
                    /*Icon(Icons.keyboard_arrow_down_sharp,color: vsAccentColor,)*/
                    Icon(Icons.keyboard_arrow_right_sharp,color: vsAccentColor,)
                  ],
                )),

              ],
            ),

          ],
        ),
      ),
    );
  }
}
