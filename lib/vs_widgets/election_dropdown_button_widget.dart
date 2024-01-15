import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppDropDownButtonWidget extends StatefulWidget {
  final List<dynamic>? listOptions;
  dynamic selectedValue;
  final Function(dynamic) onValueChanged; // New callback function
  AppDropDownButtonWidget({super.key,required this.listOptions,required this.onValueChanged}){
    selectedValue = null;
  }



  @override
  State<AppDropDownButtonWidget> createState() => _AppDropDownButtonWidgetState();
}

class _AppDropDownButtonWidgetState extends State<AppDropDownButtonWidget> {

  @override
  Widget build(BuildContext context) {
    return DropdownButton<dynamic>(
      value: widget.selectedValue,
      style: Theme
          .of(context)
          .dropdownMenuTheme
          .textStyle,
      focusColor: Colors.transparent,
      isExpanded: true,
      borderRadius: BorderRadius.circular(5),
      hint: const Text("Select election here"),
      items: widget.listOptions
          ?.map<DropdownMenuItem<dynamic>>(
            (e) {
          return DropdownMenuItem<dynamic>(
              value: e,
              child: Text(
                e.toString(),
              ));
        },
      )
          .toList(),
      onChanged: (value) {
        setState(() {
          widget.selectedValue = value;
        });
        widget.onValueChanged(value);
      },
    );
  }
}


