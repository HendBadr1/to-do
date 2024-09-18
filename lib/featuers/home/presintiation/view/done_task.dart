import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/colors.dart';
import '../../data model/note_model.dart';

import '../controller/home_controler.dart';


class DoneTasks extends StatefulWidget {
  const DoneTasks({super.key});

  @override
  State<DoneTasks> createState() => _DoneTasksState();
}

class _DoneTasksState extends State<DoneTasks> {


  @override
  Widget build(BuildContext context) {
    List<NoteModel> doneList =
    Provider.of<HomeProvider>(context).notes.where((element) => element.doneOrNot == true).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text("Done Tasks"),
      ),
      body:doneList.isEmpty ? Center(child: Text('No Done Items')): ListView.builder(
          itemCount: doneList.length,
          itemBuilder: (C, index) {
            return ListTile(
              leading: Icon(Icons.add),
              title: Text(doneList[index].title),
              subtitle: Text(doneList[index].time),
            );
          }),
    );
  }
}