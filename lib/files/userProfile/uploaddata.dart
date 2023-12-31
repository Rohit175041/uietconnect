import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uietconnect/homepage/homepage.dart';

class Uploaddata extends StatefulWidget {
  const Uploaddata({super.key});

  @override
  State<Uploaddata> createState() => _UploaddataState();
}

class _UploaddataState extends State<Uploaddata> {
  String userUID = FirebaseAuth.instance.currentUser!.uid;
  bool a = false;
  final GlobalKey<FormState> _formKey = GlobalKey();
  XFile? file;
  TextEditingController name = TextEditingController();
  TextEditingController position = TextEditingController();
  TextEditingController experience = TextEditingController();
  TextEditingController qualification = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController about = TextEditingController();
  TextEditingController socialmediaaccount = TextEditingController();
  final List<String> items = ['CSE', 'IT', 'ECE', 'EEE', 'ME', 'BT'];
  String? department;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  title(),
                  showimage(),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Name'),
                    keyboardType: TextInputType.text,
                    controller: name,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter name';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Position'),
                    keyboardType: TextInputType.text,
                    controller: position,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter position!';
                      }
                      return null;
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 150,
                        child: TextFormField(
                          decoration: const InputDecoration(
                              labelText: 'Year of experiance'),
                          keyboardType: TextInputType.number,
                          controller: experience,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter experiance';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        width: 180,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2<String>(
                            isExpanded: false,
                            hint: Text(
                              'Select Department',
                              style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).hintColor,
                              ),
                            ),
                            items: items
                                .map((String item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(
                                        item,
                                        style: const TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ))
                                .toList(),
                            value: department,
                            onChanged: (String? value) {
                              setState(() {
                                department = value;
                              });
                            },
                            buttonStyleData: const ButtonStyleData(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              height: 40,
                              width: 140,
                            ),
                            menuItemStyleData: const MenuItemStyleData(
                              height: 40,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  TextFormField(
                    decoration:
                        const InputDecoration(labelText: 'Qualification'),
                    keyboardType: TextInputType.text,
                    controller: qualification,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Qualification';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'E-Mail'),
                    keyboardType: TextInputType.emailAddress,
                    controller: email,
                    validator: (value) {
                      if (value!.isEmpty || !value.contains('@')) {
                        return 'Invalid email!';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'Social Media Account'),
                    keyboardType: TextInputType.text,
                    controller: socialmediaaccount,
                  ),
                  TextFormField(
                    maxLength: 300,
                    maxLines: 3,
                    decoration: const InputDecoration(labelText: 'About'),
                    keyboardType: TextInputType.text,
                    controller: about,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter about you';
                      }
                      return null;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0, top: 2),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate() && a == true) {
                          uploadimage();
                        } else {
                          showSnackBar(Colors.red, "fill the from");
                        }
                      },
                      child: const Text("submit"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget title() {
    return ListTile(
      leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back)),
      title: const Center(
          child: Text(
        "Profile                  ",
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
    );
  }

  //show image
  showimage() {
    return GestureDetector(
      onTap: () {
        chooseImage();
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(100)),
        height: 150.0,
        width: 150.0,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100.0),
          child: a == false
              ? const Icon(
                  Icons.photo_library_outlined,
                  // size: 50,
                )
              : Image.file(
                  File(file!.path.toString()),
                  fit: BoxFit.cover,
                ),
        ),
      ),
    );
  }

  chooseImage() async {
    try {
      file = await ImagePicker().pickImage(source: ImageSource.gallery);
      setState(() {
        a = true;
      });
    } catch (e) {
      setState(() {
        a = false;
      });
      showSnackBar(Colors.red, "please retry");
    }
  }

  //uploading image to firebase storage
  void uploadimage() async {
    try {
      final metaData = SettableMetadata();
      final storageRef = FirebaseStorage.instance.ref();
      Reference ref = storageRef
          .child('uiet/$userUID/profileimage/${DateTime.now().millisecond}');
      final uploadTask = await ref.putFile(File(file!.path), metaData);
      uploadUserData(await uploadTask.ref.getDownloadURL());
    } catch (e) {
      print(e);
    }
  }

  uploadUserData(String url) async {
    try {
      FirebaseFirestore.instance.collection('uietdep').doc('$userUID').set({
        'name': name.text,
        'position': position.text,
        'experience': experience.text,
        'department': department,
        'qualification': qualification.text,
        'email': email.text,
        'about': about.text,
        'smedia': socialmediaaccount.text,
        'img': url,
        'useruid': userUID,
        'block': false
      }).whenComplete(() => {
            setState(() {
              a = false;
            }),
            cleardata(),
            showSnackBar(Colors.green, 'Account created'),
            Navigator.pushAndRemoveUntil(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, a, b) => const Homepage(),
                  transitionDuration: const Duration(seconds: 2),
                ),
                (route) => false)
          });
    } catch (e) {
      print(e);
    }
  }

  cleardata() {
    name.clear();
    position.clear();
    experience.clear();
    qualification.clear();
    email.clear();
    about.clear();
    socialmediaaccount.clear();
  }

  void showSnackBar(dynamic color, String text) {
    var snackBar = SnackBar(
        backgroundColor: color,
        duration: const Duration(seconds: 1),
        content: Text(text));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
