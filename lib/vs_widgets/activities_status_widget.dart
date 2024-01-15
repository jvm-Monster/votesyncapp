import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:votesyncapp/stateproviders/election_type_state_notifier.dart';
import 'package:votesyncapp/vs_constants/vs_constants.dart';
import 'package:votesyncapp/vs_models/election_model.dart';
import 'package:votesyncapp/vs_models/election_type_model.dart';

class VSActivitiesStatus extends StatefulWidget {
  final String electionType;
  const VSActivitiesStatus({super.key,required this.electionType});

  @override
  State<VSActivitiesStatus> createState() => _VSActivitiesStatusState();
}

 class _VSActivitiesStatusState extends State<VSActivitiesStatus> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final va = ref.watch(electionTypeProvider);

        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
          itemCount: va.length,
          itemBuilder: (context, index) {
            ElectionType elect = va[index];
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                   
                  children: [
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("${elect.electionType} Election Activities"),
                      ],
                    ),
                    const SizedBox(height: 10,),
                   
                    const SizedBox(height: 10,),
                    Table(
                      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  
                      columnWidths: const {
                        0: FlexColumnWidth(5), // Adjust the width of the first column
                        1: FlexColumnWidth(5), // Adjust the width of the second column
                        2: FlexColumnWidth(5), // Adjust the width of the third column
                      },
                      children: [

                         TableRow(
                          children: [

                            TableCell(
                              child: status(text: "Ongoing"),
                         
                            ),
                            TableCell(
                              child: status(text: "Pending"),
                      
                            ),
                            TableCell(child:  status(text: "Concluded"),)
                          ],
                        ),

                        
                        
                        for (Election election in elect.elections)
                          TableRow(
                            children: [
                              TableCell(
                                child: Text(
                                  election.electionName!,
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(fontSize: 15),
                                ),
                              ),
                              TableCell(
                                child: Row(
                                  children: [
                                    electionState(text: "Ongoing"),
                                  ],
                                ),
                              ),
                              TableCell(
                                child: Text(
                                  election.electionStartDate!,
                                  style: const TextStyle(fontSize: 15),
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget activities() {
    List<Widget> acData = [];
    for (int i = 0; i < 3; i++) {
      acData.add(
          SizedBox(

            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    const SizedBox(height: 10,),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Faculty Election Activities"),
                      ],
                    ),
                    const SizedBox(height: 10,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        status(text: "Ongoing"),
                        status(text: "Pending"),
                        status(text: "Concluded")
                      ],
                    ),
                    const SizedBox(height: 10,),

                    Container(
                      constraints: const BoxConstraints(
                          maxHeight: 170
                      ),
                      child: ListView.builder(
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text("Ausa President", style: TextStyle(
                                  fontSize: 15
                              ),),
                              electionState(text: "Ongoing"),
                              const Text("6-11-2023", style: TextStyle(
                                  fontSize: 15
                              ),)
                            ],
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
      );
    }

    return Wrap(
      children:acData,

    );
  }

  Widget status({required String text}) {
    return Row(
      children: [
        electionStatus[text]!,
        Text(text, style: const TextStyle(
            fontSize: 15
        ),)
      ],
    );
}
  Widget electionState({required String text}){
    return electionStatus[text]!;

  }
}
