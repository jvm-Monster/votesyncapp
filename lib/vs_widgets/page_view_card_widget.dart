import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

import '../vs_constants/vs_constants.dart';

class PageViewCardWidget extends StatefulWidget {
  const PageViewCardWidget({super.key});

  @override
  State<PageViewCardWidget> createState() => _PageViewCardWidgetState();
}

class _PageViewCardWidgetState extends State<PageViewCardWidget> {
  @override
  Widget build(BuildContext context) {
    if(ResponsiveBreakpoints.of(context).largerThan(MOBILE)){
      return GridView.builder(
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1), itemBuilder: (context, index) {
            return card();
          },
      );
    }else{
      return PageView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return card();
        },
      );
    }
  }

  Widget card(){
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(

          children: [
            const Text("Ongoing Elections",style: TextStyle(
                fontSize: vsTM
            ),),

            const Text("Ausa Presidential Election",style: TextStyle(
                fontSize: vsBS
            ),),

            Image.asset(ongoingElectionImage,width: 150,)
          ],
        ),
      ),
    );
  }
}
