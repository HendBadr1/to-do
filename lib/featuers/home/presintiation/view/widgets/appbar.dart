import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/images.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.name, required this.photo});

  final String name ;
  final File photo;
  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
          color:AppColors.appcolor
      ),
      child: Row(
        children: [
          GestureDetector(
              onTap: ( ) {
                Scaffold.of(context).openDrawer();
              },
              child: Image.asset(AppImages.menu)) ,
          Expanded(
            child: Column(
              children: [
                Text("Hello"),
                SizedBox(height: 2,),

                Text(name),
                SizedBox(height: 12,),
                Text(DateTime.now().toString().split(" ")[0],
                  style: TextStyle (
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16

                  ),
                ),

              ],
            ),
          ),
          CircleAvatar(
            radius: 44,
            backgroundColor:Colors.white ,
            child: CircleAvatar(
              radius: 39,
              backgroundImage: Image.file(
                photo,
                fit: BoxFit.cover,
              ).image,
            ),
          )
        ],
      ),
    );
  }
}