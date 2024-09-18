
import 'package:flutter/material.dart';
import 'package:todo/featuers/add_note/widgets/add_note_body.dart';


class AddNoteScreen extends StatelessWidget {
  const AddNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Add Task"),
      ),
      body: AddNoteBody(),
    );
  }
}