import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.name, required this.hintText,  this.minLine = 1 ,  this.mxLine =1, required this.controller });

  final String name ;
  final String hintText;
  final int minLine;
  final int mxLine;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.circular(15),

      ),
      child: Column
        (
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name,

            style: const TextStyle(
                fontWeight: FontWeight.bold
            ),
            textAlign: TextAlign.left,
          ),
          TextFormField(
            onTapOutside: (e){
              FocusManager.instance.primaryFocus?.unfocus();
            },
            controller: controller,
            minLines: minLine, // 1
            maxLines: mxLine,   // 1

            decoration: InputDecoration(
                hintStyle: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w400
                ),
                hintText: hintText,
                enabledBorder:InputBorder.none,
                focusedBorder:InputBorder.none
            ),

          )
        ],
      ),
    );
  }
}