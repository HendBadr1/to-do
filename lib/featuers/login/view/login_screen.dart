import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../home/presintiation/view/home_screen.dart';


class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final ImagePicker picker = ImagePicker();

  XFile? image;

  pickPhoto( ImageSource imageSource)   async {

    image = await picker.pickImage(source: imageSource);
    if(image!=null ) {
      Navigator.pop(context);
    }
    setState(() {


    });

    print("${image!=null}");

  }





  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(AppImages.onboardingImage),
            GestureDetector(
              onTap: ( ){

                showModalBottomSheet(context: context, builder: (c) {
                  return Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: ( ){
                              pickPhoto(ImageSource.gallery);
                            },
                            child: Container(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.photo_size_select_actual),
                                  Text("Gallery"),
                                ],
                              ),
                            ),
                          ),

                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap : ( ) {
                              pickPhoto(ImageSource.camera);


                            },
                            child: Container(child: Column(
                              mainAxisSize: MainAxisSize.min,

                              children: [
                                Icon(Icons.add_a_photo),

                                Text("Camera"),
                              ],
                            ),),
                          ),
                        ),


                      ],
                    ),
                  );
                } );


              },
              child: Container(

                height: 120,
                width: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Color(0xff87B5E3))
                ),
                child:  image == null?  Icon(Icons.add_a_photo,
                  color:Color(0xff87B5E3) ,
                  size: 40,
                ) :  ClipRRect(

                    borderRadius: BorderRadius.circular(20),
                    child: Image.file(File(image!.path,),fit: BoxFit.cover,)),
              ),
            ),
            SizedBox(height: 4,),
            Text( image ==null?  "Add Photo":"Update Photo"),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff87B5E3))
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Your Name"),
                  TextFormField(
                    controller:nameController ,
                    decoration: InputDecoration(
                        enabledBorder:InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText: "Enter Your Name"
                    ),
                  )
                ],
              ),
            ),
            MaterialButton(
              color:Color(0xff87B5E3) ,
              onPressed: ( ) {
                if(image== null ) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error")));
                }else{
                  Navigator.push(context, MaterialPageRoute(builder: (c) {
                    return HomeScreen(
                      name:nameController.text ,
                      photo:File(image!.path) ,
                    );
                  }));
                }
              } ,child: Text("Get Started"),)


          ],
        ),
      ),
    );
  }
}

class ImageSource {
}