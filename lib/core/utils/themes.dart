import 'package:flutter/material.dart';

class AppTheme {

  final ThemeData lightThemeData= ThemeData(
      scaffoldBackgroundColor: const Color(0xffF9FEFB),
      appBarTheme: AppBarTheme(

      ),
      textTheme:TextTheme(
          titleLarge: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.w600
          )
      ),
      switchTheme: SwitchThemeData(
        // mouseCursor: MaterialStateProperty.all(MouseCursor.defer),
          thumbColor: MaterialStateProperty.all(Colors.black),

          trackColor: MaterialStateProperty.all(Colors.red)
      )

  );
  final ThemeData darkThemeData= ThemeData(
      scaffoldBackgroundColor: Color(0xff18283A),
      appBarTheme: const AppBarTheme(

      ),
      textTheme:TextTheme(
          titleLarge: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w600
          )
      ),
      switchTheme: SwitchThemeData(
        // mouseCursor: MaterialStateProperty.all(MouseCursor.defer),
          thumbColor: MaterialStateProperty.all(Colors.white)
      )

  ) ;


}





bool switchValue = false;