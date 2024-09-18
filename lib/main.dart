import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';


import 'core/utils/themes.dart';

import 'featuers/home/presintiation/controller/home_controler.dart';
import 'featuers/home/presintiation/view/task_details.dart';
import 'featuers/login/controller/theme_controller.dart';
import 'featuers/onboarding/presintation/view/on_boarding.dart';



void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('settingsBox');


  // print("switch value from hive: :${Hive.box("settingsBox").get("switchValue")}");


  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create:(c)=>ThemeProvider()),
        ChangeNotifierProvider(create:(c)=>HomeProvider()),
      ],
      child: const MyApp()));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override

  @override
  Widget build(BuildContext context) {
    Provider.of<ThemeProvider>(context,listen: false).setSwitchValueFromHive();

    return  MaterialApp(


      theme:AppTheme().lightThemeData ,
      themeMode:Provider.of<ThemeProvider>(context).switchValue == false? ThemeMode.light:ThemeMode.dark,
      darkTheme: AppTheme().darkThemeData ,
      debugShowCheckedModeBanner: false,
      home: const OnboardingScreen(),
    );
  }
}