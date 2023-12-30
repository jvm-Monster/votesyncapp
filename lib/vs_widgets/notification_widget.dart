import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../vs_constants/vs_constants.dart';
class NotificationWidget extends StatefulWidget {
  const NotificationWidget({super.key});

  @override
  State<NotificationWidget> createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget> {
  List<String> s = ["Ausa Election","ola","aaaa"];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: s.length,
      
      
      itemBuilder: (context, index) {
      return Dismissible(
        onDismissed: (direction) {
          setState(() {
            s.removeAt(index);
          });
        },
        background: Container(
          color: Colors.grey,
        ),
        key: ValueKey(s[index]),
        child: ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Presidential",style: TextStyle(
                fontSize: vsBM
              ),),
              Text(s[index],style: TextStyle(
                fontSize: vsBS
              ),),
              const Icon(Icons.circle,color: Colors.green,),
            ],
          ),
          subtitle: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Diana Jerry is leading with 25 votes gap",style: TextStyle(
                fontSize: vsBS
              ),)
            ],
          ),

          onTap: () {

          },
        ),
      );
    },);
  }
}

