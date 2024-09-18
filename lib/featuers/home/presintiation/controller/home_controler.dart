import 'package:flutter/material.dart';

import '../../data model/note_model.dart';



class HomeProvider extends ChangeNotifier{



  List<NoteModel> notes  = [ ];
  String convertDateString ( DateTime date ) {
    //2024-07-27 54df45d5d4
    // [ 2024-07-27   ,   54df45d5d4 ]

    return date.toString().split(" ")[0]  ;

  }

  String convertTime(TimeOfDay time ) {

    return  "${time.hour}:${time.minute} ${time.period.name}";

  }
  addNote(
      {
        required String title,
        required String desc,
        context
      }
      ) {
    if(time != null && startDate!=null && endDate!=null ){
      notes.add(NoteModel(time: convertTime(time!),
          startDate: convertDateString(startDate!),
          endDate: convertDateString(endDate!),
          title: title, desc: desc)) ;
      resetData();
      notifyListeners();
      Navigator.pop(context);
    }else{
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Fill data")));
    }

  }
  deleteNote(NoteModel noteModel) {
    notes.remove(noteModel) ;
    notifyListeners();
  }



  updateArchive(  int index) {
    notes[index].archiveOrNot = !notes[index].archiveOrNot;
    notifyListeners();
  }


  updateDone(  int index) {
    notes[index].doneOrNot = !notes[index].doneOrNot;
    notifyListeners();
  }




  DateTime? startDate = DateTime.now();  //
  DateTime?  endDate = DateTime.now(); //
  TimeOfDay?  time ;

  selectStartDate( context) async{
    startDate =await  showDatePicker(context: context, firstDate:DateTime.now(), lastDate: DateTime.now().add(const Duration(
      days: 365,



    )),

    );
    notifyListeners();

  }

  selectEndDate( context) async {
    endDate =await  showDatePicker(context: context, firstDate:DateTime.now(), lastDate: DateTime.now().add(const Duration(
      days: 365,

    )),
    );
    notifyListeners();

  }

  selectTime( context)  async{
    time  =    await    showTimePicker(context: context, initialTime: TimeOfDay.now());

    notifyListeners();
  }


  resetData(  ){
    startDate = DateTime.now();  //
    endDate = DateTime.now(); //
    time = null ;

  }




}