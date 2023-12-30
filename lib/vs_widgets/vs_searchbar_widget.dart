import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../vs_constants/vs_constants.dart';

class VSSearchBarWidget extends StatefulWidget {
  const VSSearchBarWidget({super.key});

  @override
  State<VSSearchBarWidget> createState() => _VSSearchBarWidgetState();
}

class _VSSearchBarWidgetState extends State<VSSearchBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SearchBar(
            constraints: const BoxConstraints(
                maxHeight: 45,
                minHeight: 45
            ),
            leading: const Icon(Icons.search,color: vsSecondaryColor,),
            hintText: "Search for a candidate",
            hintStyle: MaterialStateProperty.all(
                const TextStyle(
                    color: vsAccentColor,
                    fontSize: vsBM
                )
            ),


            shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)
                )
            ),
          ),
          const SizedBox(height: 15,),
          const Divider(
            color: vsAccentColor,

          )
        ],
      ),
    );
  }
}
