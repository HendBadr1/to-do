

class NoteModel {
  final String title;
  final String desc;
  final String time ;
  final String startDate ;
  final String endDate ;
  bool archiveOrNot;
  bool doneOrNot;


  NoteModel(
      {

        required this.time,
        required this.startDate,
        required this.endDate,
        required this.title,
        required this.desc,
        this.archiveOrNot  =false,
        this.doneOrNot =false,
      }
      );

}