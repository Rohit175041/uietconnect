import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
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
  bool a = false;
  final GlobalKey<FormState> _formKey = GlobalKey();
  XFile? file;
  TextEditingController name = TextEditingController();
  TextEditingController position = TextEditingController();
  TextEditingController experience = TextEditingController();
  TextEditingController qualification = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController about = TextEditingController();

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
                  TextFormField(
                    decoration:
                        const InputDecoration(labelText: 'Year of experiance'),
                    keyboardType: TextInputType.text,
                    controller: experience,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter experiance';
                      }
                      return null;
                    },
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
    final metaData = SettableMetadata();
    final storageRef = FirebaseStorage.instance.ref();
    Reference ref =
        storageRef.child('uiet/internmage/${DateTime.now().millisecond}');
    final uploadTask = await ref
        .putFile(File(file!.path), metaData)
        .whenComplete(() => {showSnackBar(Colors.green, "image uploaded")});
    uploadUserData(await uploadTask.ref.getDownloadURL());
  }

  uploadUserData(String url) async {
    try {
      FirebaseFirestore.instance
          .collection('uiet')
          // .doc('staffdata1jhmb')
          .add({
        'name': name.text,
        'position': position.text,
        'experience': experience.text,
        'qualification': qualification.text,
        'email': email.text,
        'about': about.text,
        'img': url
      }).whenComplete(() => {
                cleardata(),
                showSnackBar(Colors.green, 'Account created'),
                Navigator.pushAndRemoveUntil(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, a, b) => const Homepage(),
                      transitionDuration: const Duration(seconds: 1),
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
  }

  void showSnackBar(dynamic color, String text) {
    var snackBar = SnackBar(
        backgroundColor: color,
        duration: const Duration(seconds: 1),
        content: Text(text));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
