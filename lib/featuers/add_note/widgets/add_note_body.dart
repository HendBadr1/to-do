import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../../../core/shared_widgets/custom_buttom.dart';
import '../../../core/shared_widgets/custom_field.dart';
import '../../../core/utils/colors.dart';
import '../../home/presintiation/controller/home_controler.dart';

class AddNoteBody extends StatefulWidget {
  const AddNoteBody({super.key});

  @override
  State<AddNoteBody> createState() => _AddNoteBodyState();
}

class _AddNoteBodyState extends State<AddNoteBody> {

  TextEditingController nameController  =TextEditingController();
  TextEditingController descController  =TextEditingController();
  DateTime datTimeNow = DateTime.now();




  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(22),
      children: [

        CustomTextField(
          minLine: 1,
          mxLine: 1,
          controller: nameController ,
          hintText: "Enter The Task Name",
          name: "Task Name",
        ),
        const SizedBox(height: 16,),
        CustomTextField(
          controller: descController,
          minLine: 3,
          mxLine: 6,
          name: "Description",
          hintText: "Enter a description",
        ),
        const SizedBox(height: 16,),
        ListTile(
          tileColor: Colors.white,


          title: Text("Start Date"),subtitle: Text(
          Provider.of<HomeProvider>(context, listen: false).startDate== null? "Enter A Date":
          Provider.of<HomeProvider>(context,listen: false).convertDateString(Provider.of<HomeProvider>(context).startDate!),
          style: TextStyle(
              color: Colors.grey
          ),
        )       ,
          trailing: IconButton(
            onPressed: ( ) async{






              Provider.of<HomeProvider>(context,listen: false).selectStartDate(context);
            } ,
            icon: Icon(Icons.arrow_circle_down_outlined),
          ),

          leading: Icon(Icons.date_range),

        ),
        SizedBox(height: 16,),

        ListTile(
          tileColor: Colors.white,
          title: Text("End Date"),subtitle: Text(

          Provider.of<HomeProvider>(context).endDate== null? "Enter A Date":
          Provider.of<HomeProvider>(context,listen: false).convertDateString(Provider.of<HomeProvider>(context).endDate!),
          style: TextStyle(
              color: Colors.grey
          ),
        )       ,
          trailing: IconButton(
            onPressed: ( )  async {
              Provider.of<HomeProvider>(context,listen: false).selectEndDate(context);

            } ,
            icon: Icon(Icons.arrow_circle_down_outlined),
          ),
          leading: Icon(Icons.date_range),
        ),
        SizedBox(height: 16,),

        ListTile(
          tileColor: Colors.white,
          title: Text("Add Time"),subtitle: Text(
          Provider.of<HomeProvider>(context).time == null ? "Add Time":
          Provider.of<HomeProvider>(context).time!.format(context),
          style: TextStyle(
              color: Colors.grey
          ),
        )       ,
          trailing: IconButton(
            onPressed: ( )  async{

              Provider.of<HomeProvider>(context,listen: false).selectTime(context);


            } ,
            icon: Icon(Icons.arrow_circle_down_outlined),
          ),
          leading: Icon(Icons.time_to_leave),
        ),

        CustomButton(title: "Add Task",

          color: AppColors.appcolor,

          onPressed: ( ) {



            Provider.of<HomeProvider>(context, listen: false).addNote(

                desc: descController.text ,
                title: nameController.text,
                context: context
            );








          },
        )
      ],
    );
  }
}