import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/core/utils/colors.dart';
import 'package:todo/core/utils/images.dart';

import '../../../../login/presintation/view/loginscreen.dart';

class OnBoardingBody  extends StatelessWidget {
  const OnBoardingBody ({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(AppImages.header),
        Text("TODo List\n Daily Task",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),),

        SizedBox(height: 20,),
        Text("This productive tool is designed To help \nyour better manage your task     \n  project-wise conveniently!",textAlign: TextAlign.center,style: TextStyle(color:AppColors.grey),),
        SizedBox(height: 40,),
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


    );
  }
}
