import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:votesyncapp/stateproviders/election_type_state_notifier.dart';
import 'package:votesyncapp/stateproviders/loading_state_provider.dart';
import 'package:votesyncapp/vs_constants/vs_constants.dart';
import 'package:votesyncapp/vs_widgets/activities_status_widget.dart';
import 'package:votesyncapp/vs_widgets/activities_widget.dart';
import 'package:votesyncapp/vs_widgets/election_dropdown_button_widget.dart';
import 'package:votesyncapp/vs_widgets/filterby_widget.dart';
import 'package:votesyncapp/vs_widgets/greeting_widget.dart';
import 'package:votesyncapp/vs_widgets/responsive_scale_widget.dart';
import 'package:votesyncapp/vs_widgets/vs_app_drawer.dart';
import 'package:votesyncapp/vs_widgets/vs_appbar.dart';
import 'package:votesyncapp/vs_widgets/vs_searchbar_widget.dart';

import '../stateproviders/student_state_notifier.dart';
import '../vs_apis/election_api.dart';
import '../vs_apis/election_type_api.dart';
import '../vs_apis/student_api.dart';
import '../vs_models/election_model.dart';
import '../vs_models/student_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }
  String? electionType;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: keyState,
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: VSAppBar(),
        ),
        body: Consumer(
          builder: (context, ref, child) {
            final val = ref.watch(electionTypeStateProvider);
            return RefreshIndicator(
              onRefresh: () async{
                await refreshData(ref);
              },
              triggerMode: RefreshIndicatorTriggerMode.onEdge,
              edgeOffset: 50,
              displacement: 75,
              strokeWidth: 5,
              color: vsPrimaryColor,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [

                        const GreetingWidget(),
                        AppDropDownButtonWidget(
                          listOptions: val,
                          onValueChanged: (p0) {
                            ref.read(selectElectionProvider.notifier).update((state) => p0);
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  val.isEmpty?const Column(
                    children: [
                      Icon(Icons.refresh),
                      Text("Please refresh")
                    ],
                  ):
                  Expanded(
                    child: ElectionActivityStatuses(
                        electionType: electionType ?? 'AUSA'),
                  ),
                ],
              ),
            );
          },
        ),
        drawer: const VSAppDrawer());
  }

  refreshData(WidgetRef ref)async{
    Student student = Student.fromJson(await StudentApi.getStudentModel());
    List<Election> elections = await ElectionApi.getElections();
    List<String> electionTypes = await ElectionTypeApi.getElectionTypes();
    ref
        .read(studentProvider.notifier)
        .updateStudent(student);
    /*  ref
          .read(electionListProvider.notifier)
          .setElections(elections);*/

    ref
        .read(electionTypeProvider.notifier)
        .setElections(await ElectionTypeApi.getElections(student.school!.schoolId,'AUSA'));

    ref
        .read(electionTypeStateProvider.notifier)
        .update((state) => electionTypes);
  }
}
