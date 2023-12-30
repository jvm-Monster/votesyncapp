import 'package:flutter/material.dart';
import 'package:votesyncapp/vs_constants/vs_constants.dart';

class VSTheme{


  static ThemeData  lightTheme(){

    return ThemeData(
      fontFamily: "Roboto",
      textTheme: vsTextTheme,
      brightness: Brightness.light,
      useMaterial3: true,
        cardTheme: CardTheme(
            color: Colors.white
        ),
        searchBarTheme: SearchBarThemeData(
            surfaceTintColor: MaterialStateProperty.all(
                Colors.white
            )
        ),

        dropdownMenuTheme: DropdownMenuThemeData(
            textStyle: const TextStyle(
              color: Colors.black,
                fontSize: vsBS
            ),
            menuStyle: MenuStyle(
                backgroundColor: MaterialStateProperty.all(
                    vsPrimaryColor
                ),
            )
        ),
        dialogTheme: DialogTheme(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.transparent
        )

    );
  }

  static ThemeData  darkTheme(){

    return ThemeData(
      fontFamily: "Roboto",
      textTheme: vsTextTheme,
      brightness: Brightness.dark,
      useMaterial3: true,
      cardTheme: const CardTheme(
        color: vsSecondaryColor
      ),
      searchBarTheme: SearchBarThemeData(
        surfaceTintColor: MaterialStateProperty.all(
          vsSecondaryColor
        ),
       /* backgroundColor: MaterialStateProperty.all(
          vsSecondaryColor
        ),*/

      ),
       dropdownMenuTheme: DropdownMenuThemeData(
         textStyle: const TextStyle(
           color: vsAccentColor,
           fontSize: vsBS
         ),
         menuStyle: MenuStyle(
           backgroundColor: MaterialStateProperty.all(
             vsPrimaryColor
           )
         )
       ),

    );
  }
}