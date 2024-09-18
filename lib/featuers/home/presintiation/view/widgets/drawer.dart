import 'package:flutter/material.dart';
import 'package:todo_cycle_8_session/featrues/home/presentation/view/done_tasks.dart';

import '../../../../../core/utils/colors.dart';
import '../archived_tasks.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        DrawerHeader(
            decoration: BoxDecoration(color: AppColors.mainColor),
            child: Row(
              children: [
                CircleAvatar(),
                Text("ziad elsaadany")
              ],
            )) ,

        SizedBox(height: 18,),
        Padding(
          padding: const EdgeInsets.only(right: 24.0),
          child: ListTile(
            onTap: ( ) {
              Navigator.push(context, MaterialPageRoute(builder: (C) {
                return ArchivedTasks();
              } ));
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    bottomRight: Radius.circular(15)
                )
            ),

            tileColor: Colors.yellow,
            leading: Icon(Icons.archive),

            title: Text("Archived Tasks"),
          ),
        ),


        SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.only(right: 24.0),


          child: ListTile(
            onTap: ( ){
              Navigator.push(context, MaterialPageRoute(builder: (C) {
                return DoneTasks();
              } ));
            },
            tileColor: Colors.yellow,

            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    bottomRight: Radius.circular(15)
                )
            ),
            title: Text("Done Tasks"),
          ),
        ),
      ],
    );
  }
}