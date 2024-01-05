import 'package:flutter/material.dart';

import '../vs_constants/vs_constants.dart';

class VSInputFormWidget extends StatelessWidget {
  final TextEditingController inputController;
  final String labelText;
  final Icon prefixIcon;
  final Function(String value) validate;
  final bool obscurePassword;
  const VSInputFormWidget({super.key,required this.prefixIcon,
    required this.labelText,required this.inputController,required this.validate,required this.obscurePassword});

  @override
  Widget build(BuildContext context) {
    return   SizedBox(

      child: TextFormField(
        controller: inputController,
        validator:(value) {
          return validate(value!);
        },

        obscureText: obscurePassword,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 10.0), // Adjust the value as needed

            prefixIcon: prefixIcon,

            labelText: labelText,
            labelStyle: const TextStyle(
                fontSize: vsBS,
                color: vsAccentColor
            ),


            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: vsPrimaryColor),
                borderRadius: BorderRadius.all(Radius.circular(5))
            ),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: vsAccentColor),
                borderRadius: BorderRadius.all(Radius.circular(5))
            ),
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5))
            )
        ),
      ),
    );
  }
}
