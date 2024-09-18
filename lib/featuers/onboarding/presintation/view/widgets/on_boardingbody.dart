import 'package:flutter/material.dart';

import '../../../../home/presintiation/view/task_details.dart';
import '../../../../login/controller/theme_controller.dart';
import '../../../../login/view/login_screen.dart';

class OnboardingBody extends StatefulWidget {
  const OnboardingBody({super.key});

  @override
  State<OnboardingBody> createState() => _OnboardingBodyState();
}

class _OnboardingBodyState extends State<OnboardingBody> {

  // bool switchValue = false;
  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 22.0),
      child: Column(
        children: [ Switch(value:   Provider.of<ThemeProvider>(context).switchValue, onChanged: ( b){


          Provider.of<ThemeProvider>(context,listen: false).changeSwitchValue(b);



        }),
          Image.asset(AppImages.onboardingImage),
          Text('''ToDo List
  Daily Task''',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge,
          ),   SizedBox(
            height: 21,
          ),
          Text('''This productive tool is designed to help
      you better manage your task 
      project-wise conveniently!''',
            textAlign: TextAlign.center,
            style: TextStyle(

                fontSize: 14,
                color: Color(0xff8E8E8E)
            ),
          ),
          SizedBox(
            height: 50,
          ),
          MaterialButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
            ),
            color: Color(
                0xff90B6E2
            ),
            onPressed: ( ) {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) {
                return LoginScreen();
              }));
            },
            child: Row(
              children: [
                Expanded(
                  child: Text("Let’s Start",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                ),
                Icon(Icons.arrow_forward_ios)
              ],
            ),
          )
        ],
      ),
    );
  }
}