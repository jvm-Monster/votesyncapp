import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:votesyncapp/stateproviders/candidate_state_provider.dart';
import 'package:votesyncapp/stateproviders/election_type_state_notifier.dart';
import 'package:votesyncapp/stateproviders/student_state_notifier.dart';
import 'package:votesyncapp/vs_apis/vote_api.dart';
import 'package:votesyncapp/vs_constants/vs_constants.dart';
import 'package:votesyncapp/vs_models/candidate_model.dart';
import 'package:votesyncapp/vs_widgets/voted_widget.dart';

import '../vs_models/vote_model.dart';

final getUserVoteForCurrentElection = FutureProvider<Map?>((ref) {
  final v = ref.watch(electionSelected);
  final s = ref.watch(studentProvider);
  String studentId = s.studentId!;//studentId
  String schoolId = s.school!.schoolId!;//schoolId
  String electionType = v!.electionType!;//electionType
  String? electionName = v.electionName!;//electionName

  //after getting the data we use it to make a request to the api, to retrieve  data that would be available in the future
  return VoteApi.getStudentVotes(
      studentId, schoolId, electionType, electionName);
});

final votedd = StateProvider<bool?>((ref) => false);

// This is A widget that allows the user to either vote or view candidates campaign.
class VotingWidget extends ConsumerStatefulWidget {
  const VotingWidget({super.key});

  @override
  ConsumerState createState() => _VotingWidgetState();
}

class _VotingWidgetState extends ConsumerState<VotingWidget> {
  bool vote = false;
  @override
  Widget build(BuildContext context) {
    //padding
    return Padding(
        padding: const EdgeInsets.all(8.0), //padding size
        child: listOfCandidates() //list of candidate Widget
        );
  }

  // Takes a parameter of a Candidate Object and displays it
  Widget cardWidget(Candidate candidate, bool check) {
    final student = ref.watch(studentProvider);
    final election = ref.watch(electionSelected);

    Vote candidateToVote = Vote("can_voted_sa", true, student,student.school!, candidate, election);
    //Card widget
    return Card(
      //padding
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        //Column for vertical layout
        child: Column(
          children: [
            check
                ? const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: Colors.green,
                      )
                    ],
                  )
                : Container(),
            profilePictureWidget(
                voteSuccessfullImage), // displays the profile picture of the candidate
            const SizedBox(
              height: 10,
            ), //space of 10 in a vertical way
            candidateName(candidate.student!.studentName!),

            const SizedBox(
              height: 10,
            ), //space of 10 in a vertical way

            //A row to display the two buttons in an horizontal way and put spaces between them
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                actionOnViewCandidateCampaign(() {},
                    "View campaign"), // a button for the user to view campaigns

                actionOnVoteCandidateButton(
                    ()async{
                      bool valid = await VoteApi.voteCandidate(candidateToVote);
                      // Use ref.refresh to refresh the provider that holds the list of candidates
                      final checkVoteStatus = ref.refresh(getUserVoteForCurrentElection);
                      checkVoteStatus.when(
                          data: (data) {
                            print(data);
                      if (valid == false) {
                              showDialog(context: context, builder: (context) => const VotedWidget(title: "Vote Unsuccessful", voteSuccessImage: voteUnSuccessfullImage));
                            }else{
                              showDialog(context: context, builder: (context) => const VotedWidget(title: "Vote Successful", voteSuccessImage: voteSuccessfullImage));
                            }

                          }, error: (error, stackTrace) {
                              return  showDialog(context: context, builder: (context) => const VotedWidget(title: "An error occurred", voteSuccessImage: voteUnSuccessfullImage));
                      }, loading: () {
                              return const Center(child: CircularProgressIndicator());
                          },);
                 },

                        "Vote candidate"), // a button for the user to vote for their preferred candidate
              ],
            )
          ],
        ),
      ),
    );
  }

  // views the candidate profile picture
  Widget profilePictureWidget(String profilePicture) {
    return CircleAvatar(
      radius: 60, //the size of the circular profile picture
      child: Image.asset(profilePicture),
    );
  }

  // This widgets views the candidate information
  Widget candidateName(String candidateName) {
    return Column(
      children: [
        const Text(
            "Computer Science"), // this displays the candidate department
        const Text("100L"), // this displays the candidate class
        Text(candidateName) // this displays the candidate name
      ],
    );
  }

  // is basically used by the user to perform an action on a candidate,
  // to vote the candidate or view the campaign of the candidate.
  Widget actionOnVoteCandidateButton(
      VoidCallback? function, String buttonName) {

    return ref.watch(getUserVoteForCurrentElection).when(
      data: (data) {
        bool? voted = data?["voted"];
        if (voted == null || voted == false) {
          return ElevatedButton(onPressed: function, child: Text(buttonName));
        }
        return ElevatedButton(
            onPressed: voted ? null : function, child: Text(buttonName));
      },
      error: (error, stackTrace) {
        return Container(
          child: Text("An error "),
        );
      },
      loading: () {
        return Container();
      },
    );
  }

  Widget actionOnViewCandidateCampaign(
      VoidCallback? function, String buttonName) {
    return ElevatedButton(onPressed: function, child: Text(buttonName));
  }

  // This widget returns a list of the cardWidget which takes a
  // parameter of Candidate object, and rebuilds anytime there is
  // a change in the state
  Widget listOfCandidates() {
    final candidateInfos = ref.watch(
        candidateStateProvider); // watching the state of the candidateStateProvider to have the updated data
    return ListView.builder(
      itemCount: candidateInfos
          .length, // the length of the list of candidates retrieved from the state
      itemBuilder: (context, index) {
        Candidate candidate = candidateInfos[
            index]; //by using the index we get a Candidate object

        //watching the getUserVoteForCurrentElection future method, to display widget base on the current data
        return ref.watch(getUserVoteForCurrentElection).when(
          data: (data) {
            bool check =
                false; //this would be used to pass into the cardWidget so that we can show whom they have voted for.
            //the "data" variable needs to be check if its is null or empty, so importantly not to receive any errors.
            if (data == null || data.isEmpty) {
              return cardWidget(candidate, check); //we return a cardWidget
            } else {
              //If data is not null we run the code here
              Candidate? candidateValidated = Candidate.fromJson(data[
                  "candidate"]); //get the candidate they already voted for.


              // we check if the candidate they have voted for is in the list of candidates we have retrieved, if it is then we can make the check true
              // in so that we can view a check widget with a green color showing this is whom they voted for.
              if (candidateValidated.candidateId == candidate.candidateId) {
                check = true;
              }

              //else we had rather just return check with false.
              return cardWidget(candidate,
                  check); //passing the candidate object to the cardWidget
            }
          },


          //Right now this just returns an error and we return a widget to show the user there is an error
          error: (error, stackTrace) {
            return const Column(children: [
              Text(
                  "Could not get candidates, try refreshing or \ncheck your internet connection"),
            ]);
          },

          //returns a loading widget if data is not currently here.
          loading: () {
            return const Center(child: CircularProgressIndicator());
          },
        );
      },
    );
  }


}
