import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:votesyncapp/stateproviders/candidate_state_provider.dart';
import 'package:votesyncapp/stateproviders/election_state_notifier.dart';
import 'package:votesyncapp/stateproviders/student_state_notifier.dart';
import 'package:votesyncapp/vs_apis/candidate_api.dart';

import 'package:intl/intl.dart';
import 'package:votesyncapp/vs_apis/vote_api.dart';
import 'package:votesyncapp/vs_constants/vs_constants.dart';
import 'package:votesyncapp/vs_screens/vote_screen.dart';

import '../stateproviders/election_type_state_notifier.dart';
import '../vs_models/candidate_model.dart';


class ElectionActivityStatuses extends ConsumerStatefulWidget {
  final String electionType;
  const ElectionActivityStatuses({super.key,required this.electionType});

  @override
  ConsumerState createState() => _ElectionActivityStatusesState();
}

class _ElectionActivityStatusesState extends ConsumerState<ElectionActivityStatuses> {

  getCandidatesApi(String studentId, String electionType, String electionName)async{
    List<Candidate> candidates = await CandidateApi.getCandidatesApi(studentId,electionType,electionName);
    ref.read(candidateStateProvider.notifier).update((state) => candidates);
  }

  getStudentVotesApi(String studentId,String schoolId,String electionType,String electionName)async{
     Map votes = await VoteApi.getStudentVotes(studentId, schoolId,electionType,electionName);
        ref.read(studentVotesProvider.notifier).update((state) => votes);
     }
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ref.watch(selectElectionTypeProvider).when(
        data: (data) {
          final electionTypes = data;
          final forStudent = ref.watch(studentProvider);

          if(electionTypes.isEmpty){
            return Container();
          }
          return SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  for (var electionType in electionTypes)
                    for (var election in electionType.elections)
                      Card(
                        child: ListTile(
                          onTap: () {
                            getStudentVotesApi(forStudent.studentId!, forStudent.school!.schoolId!,electionType.electionType,election.electionName!);
                            getCandidatesApi(forStudent.school!.schoolId!, election.electionType!, election.electionName!);

                            ref.read(electionSelected.notifier).update((state) => election);
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) => VoteScreen(screenTitle: "${electionType.electionType} ${election.electionName} Election",),));
                          },
                          trailing: checkStatus(election.electionStatus!),
                          title: Text(election.electionName!),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  'Start Date: ${formatDate(DateTime.parse(election.electionStartDate!))}',
                                style: const TextStyle(
                                  fontSize: vsBS
                                ),
                              ),
                              Text(
                                  'End Date: ${formatDate(DateTime.parse(election.electionEndDate!))}',
                                style: const TextStyle(
                                    fontSize: vsBS
                                ),
                              )
                            ],
                          )
                        ),
                      ),
                ],
              ),
            ),
          );
        },
        error:  (error, stackTrace) {
          return const Text('Error');
        },
        loading:  () {
          return const Center(child: CircularProgressIndicator());
        },);

  }
  String formatDate(DateTime dateTime) {
    return DateFormat.yMd().add_Hm().format(dateTime);
    // Adjust the pattern as per your preference, check the DateFormat class for more options
  }
  
  Widget checkStatus(String value){
    if(value=='Concluded'){
      return  const Icon(Icons.circle,color: Colors.green,);
    }else if(value=='Pending'){
      return  const Icon(Icons.circle,color: Colors.red,);
    }else{
      return  const Icon(Icons.circle,color: Colors.yellow,);
    }
  }


}
