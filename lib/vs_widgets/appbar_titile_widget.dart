import 'package:flutter/cupertino.dart';

import '../vs_constants/vs_constants.dart';

class AppBarTitleWidget extends StatelessWidget {
  final String title;
  const AppBarTitleWidget({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(title,style: TextStyle(
      fontSize: vsBM
    ),);
  }
}
