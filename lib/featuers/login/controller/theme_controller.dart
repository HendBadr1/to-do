


import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ThemeProvider  with ChangeNotifier{


  bool  switchValue  =false;




  setSwitchValueFromHive( ) {
    var box= Hive.box("settingsBox");
    switchValue = box.get("switchValue") ?? false ;
    notifyListeners();


  }




  changeSwitchValue(bool     t ) async{

    var box= Hive.box("settingsBox");
    await box.put("switchValue",t );
    switchValue = box.get("switchValue");


    // switchValue = true;

    notifyListeners( );
    //  set state ( )
  }




}