import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:votesyncapp/stateproviders/candidate_state_provider.dart';
import 'package:votesyncapp/stateproviders/election_state_notifier.dart';
import 'package:votesyncapp/stateproviders/election_type_state_notifier.dart';
import 'package:votesyncapp/vs_apis/vote_api.dart';
import 'package:votesyncapp/vs_constants/vs_constants.dart';
import 'package:votesyncapp/vs_models/candidate_model.dart';
import 'package:votesyncapp/vs_widgets/voted_widget.dart';

import '../stateproviders/student_state_notifier.dart';
import '../vs_apis/candidate_api.dart';
import '../vs_models/election_model.dart';
import '../vs_models/student_model.dart';
import '../vs_models/vote_model.dart';

class VotingWidget extends ConsumerStatefulWidget {
  const VotingWidget({super.key,});

  @override
  ConsumerState createState() => _VotingWidgetState();
}

class _VotingWidgetState extends ConsumerState<VotingWidget> {
  bool isDialogShown = false; // Add this flag

  @override
  Widget build(BuildContext context) {
    final candidatesState = ref.watch(candidateStateProvider);
    final votesState = ref.watch(studentVotesProvider);
    final studentState = ref.watch(studentProvider);
    final selectedElectionState = ref.watch(electionSelected);


    if (votesState.isEmpty) {
      if (!isDialogShown) {
        isDialogShown =
            true; // Set the flag to true to prevent multiple dialogs
        Future.delayed(Duration.zero, () {
          // Show a dialog if votesState is empty
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Notification"),
                content: Text("You have not voted in this election."),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("OK"),
                  ),
                ],
              );
            },
          );
        });
      }

      if (candidatesState.isEmpty) {
        return ListView.builder(
          itemCount: candidatesState.length,
          itemBuilder: (context, index) {
            Candidate candidate = candidatesState[index];

            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 40,
                            child: Text(candidate.student!.studentName!
                                .substring(0, 1)),
                          ),
                          Text(candidate.student!.studentName!),
                          const Text("Software Development"),
                          Text(candidate.student!.studentLevel!),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              button(selectedElectionState!, studentState, candidate)
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      }
    }


    if(votesState.isEmpty){
      return ListView.builder(
        itemCount: candidatesState.length,
        itemBuilder: (context, index) {
          Candidate candidate = candidatesState[index];

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          child: Text(
                              candidate.student!.studentName!.substring(0, 1)),
                        ),
                        Text(candidate.student!.studentName!),
                        const Text("Software Development"),
                        Text(candidate.student!.studentLevel!),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              child: const Text("Campaign"),
                            ),

                          button(selectedElectionState!, studentState, candidate)
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      );
    }

    return ListView.builder(
      itemCount: candidatesState.length,
      itemBuilder: (context, index) {
        Candidate candidate = candidatesState[index];


        Election election = Election.fromJson(votesState['election']);
        int candidateIdToCompare =
            Candidate.fromJson(votesState['candidate']).candidateId;
        bool voted = votesState['voted'];
        bool votedForCandidate = voted;

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        child: Text(
                            candidate.student!.studentName!.substring(0, 1)),
                      ),
                      Text(candidate.student!.studentName!),
                      const Text("Software Development"),
                      Text(candidate.student!.studentLevel!),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text("Campaign"),
                          ),

                              ElevatedButton(
                                  onPressed: votedForCandidate ?null:(){},
                                  child: const Text("Vote"),
                                ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
  showVotingStatusDialog(String title,String voteSuccessImage,){
    return showDialog(context: context, builder: (context) => VotedWidget(title: title, voteSuccessImage: voteSuccessImage));
  }

  Widget button(Election selectedElectionState,Student studentState,Candidate candidate){
    return   ElevatedButton(
      onPressed: () async {

        bool voted = true;
        Student student = Student(
          studentState.studentId,
          null,
          null,
          null,
          null,
          studentState.school,
        );
        Election election = Election(electionId: selectedElectionState.electionId);


        Vote vote = Vote(
            'asdfs',
            voted,
            student,
            student.school,
            candidate,
            election
        );
        bool val = await VoteApi.voteCandidate(vote);
        if(val){
          setState(() {

          });
          showVotingStatusDialog("Vote Successful",voteSuccessfullImage);
        }else{
          showVotingStatusDialog("Vote Not Successful",voteUnSuccessfullImage);
        }
      },
      child: const Text("Vote"),
    );
  }


  getCandidatesApi(String studentId, String electionType, String electionName)async{
    List<Candidate> candidates = await CandidateApi.getCandidatesApi(studentId,electionType,electionName);
    ref.read(candidateStateProvider.notifier).update((state) => candidates);
  }

  getStudentVotesApi(String studentId,String schoolId,String electionType,String electionName)async{
    Map votes = await VoteApi.getStudentVotes(studentId, schoolId,electionType,electionName);
    ref.read(studentVotesProvider.notifier).update((state) => votes);
  }
}
