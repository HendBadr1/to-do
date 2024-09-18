import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:todo/featuers/home/presintiation/view/task_details.dart';
import 'package:todo/featuers/home/presintiation/view/widgets/appbar.dart';
import 'package:todo/featuers/home/presintiation/view/widgets/drawer.dart';


import '../../../../core/utils/colors.dart';
import '../../../add_note/add_note_screen.dart';
import '../../data model/note_model.dart';
import '../controller/home_controler.dart';

im

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.name, required this.photo});

  final String name ;
  final File photo;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    List<NoteModel>   unArchiveNotes =Provider.of<HomeProvider>(context).notes.where((element) =>element.archiveOrNot==false).toList();
    return  SafeArea(
      child: Scaffold(
        floatingActionButtonLocation:     FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          foregroundColor: Colors.white,
          backgroundColor: AppColors.appcolor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30)
          ),
          onPressed: ( ){

            // showModalBottomSheet(context: context, builder: (c) {
            //   return Text("zzz") ;
            // });



            Navigator.push(context, MaterialPageRoute(builder: (c) {
              return  AddNoteScreen();
            } ));


          },
          child: Icon(Icons.add),
        ),


        drawer: Drawer(
          child: CustomDrawer(),
        ),
        body: Column(
          children: [
            CustomAppBar(name: widget.name, photo: widget.photo),
            Expanded(
              child:  unArchiveNotes.isEmpty?


              const Center(child: Text("No Notes Yet!"))
                  :      ListView.builder(

                  itemCount: unArchiveNotes.length,
                  itemBuilder: (c,index) {
                    return  Dismissible(
                      background: Container(
                        child: Icon(Icons.delete),
                        color: Colors.red,
                      ),
                      key: GlobalKey(),
                      child: ListTile(
                        onTap: ( ) {
                          Navigator.push(context, MaterialPageRoute(builder: (C) {
                            return TaskDetails( noteModel: unArchiveNotes[index] ,);
                          } )).then((value) =>setState(() {

                          }));
                        },
                        trailing: GestureDetector(
                          onTap: ( ) {

                            setState(() {
                              unArchiveNotes[index].doneOrNot = !unArchiveNotes[index].doneOrNot;
                            });

                            // false - -> true
                          },
                          child: Container(

                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: unArchiveNotes[index].doneOrNot ? AppColors.appcolor:Colors.white,
                                  border: Border.all(color:AppColors.appcolor ),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: Text("done")),
                        ),
                        leading: Icon(Icons.add),
                        title: Text(unArchiveNotes[index].title),
                        subtitle: Text(unArchiveNotes[index].time),

                      ),
                    );
                  }),
            )

          ],
        ),
      ),
    );
  }
}