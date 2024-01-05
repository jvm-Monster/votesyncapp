import 'package:flutter/material.dart';
import 'package:votesyncapp/vs_constants/vs_constants.dart';

class HelpWidget extends StatefulWidget {
  const HelpWidget({super.key});

  @override
  State<HelpWidget> createState() => _HelpWidgetState();
}

class _HelpWidgetState extends State<HelpWidget> {
  List<String> faqs=["How To Vote","How Do I know I have Voted","I am having a network issue"];
  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      itemCount: faqs.length,
      itemBuilder:(context, index) {
       return Column(
         children: [

           ListTile(
             subtitle: Text(faqs[index]),
           ),
           const Divider(
             color: vsAccentColor,
           ),
         ],
       );
    },);
  }
}
