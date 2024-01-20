import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../utils/global.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  String? path;
  TextEditingController txtName = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtContact = TextEditingController();
  TextEditingController txtAddress = TextEditingController();
  GlobalKey<FormState>key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return  Form(
      key: key,
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Sign in",style: TextStyle(color: Colors.blue,fontSize: 30,fontWeight: FontWeight.bold),),
                    const SizedBox(height: 20,),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(top: 20),
                    height: MediaQuery.sizeOf(context).height * 0.30,
                    width: MediaQuery.sizeOf(context).width * 0.85,
                    color: Colors.white,
                    child:  Stack(
                      alignment: Alignment.center,
                      children: [
                        path==null?
                        const CircleAvatar(
                          backgroundColor: Colors.grey,
                          radius: 90,
                        ): CircleAvatar(
                          radius: 90,
                          backgroundImage: FileImage(File(path!)),
                        ),
                        Align(
                            alignment: Alignment(0.5, 0.5),
                            child: IconButton(
                              onPressed: () async{
                                ImagePicker picker = ImagePicker();
                                XFile? image = await picker.pickImage(source: ImageSource.camera);
                                setState(() {
                                  path=image!.path;

                                });

                              },
                              icon: const Icon(
                                Icons.add_a_photo_rounded,
                                color: Colors.blueAccent,
                                weight: 50,
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
                    TextFormField(
                        validator: (value) {
                          if(value!.isEmpty)
                          {
                            return "Name is required ";
                          }
                          return null;
                        },
                        controller: txtName,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Name",
                        )
                    ),
                    const SizedBox(height: 10,),
                    TextFormField(
                        validator: (value) {
                          if(value!.isEmpty)
                          {
                            return "Email is required ";
                          }
                          else if(!RegExp("^[a-zA-Z0-9.!#\$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*\$").hasMatch(value))
                          {
                            return "enter the valid email";
                          }
                          return null;
                        },
                        controller: txtEmail,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "email@gmail.com",
                        )
                    ),
                    const SizedBox(height: 10,),
                    TextFormField(
                        validator: (value) {
                          if(value!.isEmpty)
                          {
                            return "contact No is required";
                          }
                          else if (value!.length!=10)
                          {
                            return "Enter the valid number";
                          }
                          return null;
                        },
                        controller: txtContact,
                        decoration: const InputDecoration(

                          border: OutlineInputBorder(),
                          hintText: "Contact Number",
                        )
                    ),
                    const SizedBox(height: 10,),
                    TextFormField(
                        validator: (value) {
                          if(value!.isEmpty)
                          {
                            return "address is required";
                          }

                          return null;
                        },
                        controller: txtAddress,
                        decoration: const InputDecoration(

                          border: OutlineInputBorder(),
                          hintText: "Address",
                        )
                    ),
                    const SizedBox(height: 20,),
                    Center(
                      child: ElevatedButton(onPressed: () {
                        FocusScope.of(context).unfocus();
                        if(key.currentState!.validate())
                        {
                          String name = txtName.text;
                          String email = txtEmail.text;
                          String contact = txtContact.text;
                          String address= txtAddress.text;


                         dataList["name"]=name;
                         dataList["email"]=email;
                         dataList["contact"]=contact;
                         dataList["address"]=address;
                         dataList["image"]=path;

                          txtName.clear();
                          txtEmail.clear();
                          txtContact.clear();
                          txtAddress.clear();
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Data is saved")));
                          setState(() {
                            Navigator.pushNamed(context, 'home');
                          });
                        }
                        }, child: const Text("Submit")
                      ),
                    ),


                  ]
              ),
            ),
          ),
        ),
      ),
    );
  }
}
