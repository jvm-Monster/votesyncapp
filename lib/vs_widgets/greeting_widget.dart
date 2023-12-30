import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:votesyncapp/stateproviders/student_state_notifier.dart';
import 'package:votesyncapp/vs_apis/student_api.dart';
import 'package:votesyncapp/vs_models/student_model.dart';
import 'package:votesyncapp/vs_widgets/student_name_widget.dart';

import '../vs_constants/vs_constants.dart';

class GreetingWidget extends ConsumerStatefulWidget {
  const GreetingWidget({super.key});

  @override
  ConsumerState createState() => _GreetingWidgetState();
}

class _GreetingWidgetState extends ConsumerState<GreetingWidget> {
  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text("Hello, ",style: TextStyle(
              fontSize: vsBL,
              color: vsAccentColor,
            ),),
            StudentInfoWidget.studentName(context,const TextStyle(
                fontSize: vsTM,
                color: vsPrimaryColor,
                fontWeight: FontWeight.bold
            ),)
          ],
        ),
        const Text("Welcome to the Adeleke student voting platform",style: TextStyle(
            fontSize: vsBS,
            color: vsAccentColor
        ),),
      ],
    );
  }
}
