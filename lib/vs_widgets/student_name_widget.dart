
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../stateproviders/student_state_notifier.dart';
int i=0;

class StudentInfoWidget{

  static Widget studentName(context,TextStyle textStyle){
    return Consumer(
        builder: (context, ref, child) {

          final name = ref.watch(studentProvider);

          return Text(name.studentName!,
            style: textStyle);
        }
    );

  }
  static Widget studentEmail(context,TextStyle textStyle){
    return Consumer(
        builder: (context, ref, child) {

          final email = ref.watch(studentProvider);

          return Text(email.studentEmail!,
            style: textStyle,);
        }
    );

  }

  static Widget studentOtherInfo(context,TextStyle textStyle){
    return Consumer(
        builder: (context, ref, child) {

          final otherInfo = ref.watch(studentProvider);

          return Text(otherInfo.school!.schoolName!,
            style: textStyle,);
        }
    );
  }


}
