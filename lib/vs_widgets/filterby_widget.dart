import 'package:flutter/material.dart';
import 'package:votesyncapp/main.dart';
import 'package:votesyncapp/vs_apis/student_api.dart';
import 'package:votesyncapp/vs_constants/vs_constants.dart';
import 'package:votesyncapp/vs_widgets/election_dropdown_button_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FilterByWidget extends ConsumerStatefulWidget {
  const FilterByWidget({super.key});

  @override
  ConsumerState createState() => _FilterByWidgetState();
}

class _FilterByWidgetState extends ConsumerState<FilterByWidget> {
  String filterBy="";
  List<String>listOptions = ["asdsfsd","asdfsdfsd","sfdsfsd"];
  @override
  Widget build(BuildContext context) {
    final filter=ref.watch(filterByProvider);
    filterBy = filter!;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Text(
                "Filter by:",
                style: TextStyle(color: vsAccentColor),
              ),

            ],
          ),
              Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   filterByButton(
                       buttonName: "Ongoing",
                       function: () {
                         StudentApi.getStudentModel();
                       }),
                   filterByButton(
                       buttonName: "Pending",
                       function: () {
                         print("Pending");
                       }),
                   filterByButton(
                       buttonName: "Concluded",
                       function: () {
                         print("Concluded");
                       })
                 ],
               )

        ],
      ),
    );
  }


  Widget filterByButton({required String buttonName, required VoidCallback function}) {

    return OutlinedButton(
        onPressed: () {
          function();


            if (filterBy == buttonName) {
               ref.read(filterByProvider.notifier).update((state) => "");
            } else {
              ref.read(filterByProvider.notifier).update((state) => buttonName);
            }

        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                filterBy == buttonName ? vsPrimaryColor : null),
            side: MaterialStateProperty.all(BorderSide(
                color: filterBy == buttonName
                    ? Colors.transparent
                    : vsAccentColor))),
        child: Text(
          buttonName,
          style: TextStyle(
              color: filterBy == buttonName ? Colors.white : vsAccentColor),
        ));
  }
}


