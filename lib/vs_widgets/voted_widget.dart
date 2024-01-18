import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:votesyncapp/vs_constants/vs_constants.dart';

class VotedWidget extends StatefulWidget {
  final String title;
  final String voteSuccessImage;
  const VotedWidget({super.key,required this.title,required this.voteSuccessImage});

  @override
  State<VotedWidget> createState() => _VotedWidgetState();
}

class _VotedWidgetState extends State<VotedWidget> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title,style: const TextStyle(fontSize: vsBM),),
      content: Image.asset(
        widget.voteSuccessImage
      ),
      actions: [
        IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.check))
      ],
    );
  }


}
