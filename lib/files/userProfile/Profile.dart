import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import '../../homepage/homepage.dart';
import '../Quicksitelink/uietsitelink.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

DateTime currentTime = DateTime.now();
String date = DateFormat.yMd().format(currentTime);

class _ProfileState extends State<Profile> {
  User? user = FirebaseAuth.instance.currentUser;
  final GlobalKey<FormState> _formKey = GlobalKey();
  XFile? file;
  bool a = false;
  TextEditingController name = TextEditingController();
  TextEditingController position = TextEditingController();
  TextEditingController experience = TextEditingController();
  TextEditingController qualification = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController about = TextEditingController();
  TextEditingController pname = TextEditingController();
  TextEditingController aboproj = TextEditingController();

//TODO Add your own Collection Name instead of 'users'
  CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('uietdep');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      // body: pro()
      body: SafeArea(
        child: StreamBuilder<DocumentSnapshot>(
            stream: usersCollection.doc(user!.uid).snapshots(),
            builder: (ctx, streamSnapshot) {
              if (streamSnapshot.connectionState == ConnectionState.waiting ||
                  streamSnapshot.error != null) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.blue,
                  ),
                );
              } else {
                if (streamSnapshot.data == null) {
                  return Center(
                      child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "no user data found",
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.5),
                                fontWeight: FontWeight.w300,
                                fontSize: 25),
                          )));
                }
                // return Text(streamSnapshot.data!['name']);
                return SizedBox(
                  height: MediaQuery.sizeOf(context).height,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 8.0, top: 5, bottom: 15, right: 5),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Card(
                            child: ListTile(
                              leading: GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Icon(Icons.arrow_back)),
                              trailing: GestureDetector(
                                  onTap: () {
                                    alert(
                                        user!.uid, streamSnapshot.data!['img']);
                                  },
                                  child: const Icon(Icons.settings)),
                            ),
                          ),
                        ),
                        Card(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  alertimage();
                                },
                                child: Container(
                                  height: 120.0,
                                  width: 110.0,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        streamSnapshot.data!['img'],
                                        // fit: BoxFit.cover,
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                    shape: BoxShape.rectangle,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 8.0, top: 5),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        alertname('name');
                                      },
                                      child: Text(
                                        streamSnapshot.data!['name'],
                                        style: const TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold),
                                        overflow: TextOverflow.visible,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        alertposition('Position');
                                      },
                                      child: Text(
                                        streamSnapshot.data!['position'],
                                        style: const TextStyle(
                                            // fontSize: 20,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 18,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        alertqualification('Qualification');
                                      },
                                      child: Text(
                                        streamSnapshot.data!['qualification'],
                                        style: const TextStyle(
                                            // fontSize: 25,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        alertexperience('Experience');
                                      },
                                      child: Text(
                                        'Teaching experience: ${streamSnapshot.data!['experience']} years',
                                        style: const TextStyle(
                                            // fontSize: 25,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            alertemail('Email');
                          },
                          child: Card(
                            child: ListTile(
                              leading: const Icon(Icons.email),
                              title: Text(streamSnapshot.data!['email']),
                              // onTap: () {
                              //   Copyfunction().copyToClipboard(
                              //       streamSnapshot.data!['email']);
                              // },
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            title('About'),
                            IconButton(
                              onPressed: () {
                                alertabout(
                                    'About', streamSnapshot.data!['about']);
                              },
                              icon: const Icon(
                                Icons.add,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 5.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              streamSnapshot.data!['about'],
                              style:
                                  const TextStyle(fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                        // const Divider(),
                        title('Research Project'),
                        Expanded(child: projectlist())
                      ],
                    ),
                  ),
                );
              }
            }),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey.withOpacity(0.2),
        onPressed: () {
          addproject();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget title(String title) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8),
        child: Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Widget projectlist() {
    return StreamBuilder(
        stream: usersCollection
            .doc(user!.uid)
            .collection('researchProject')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            children: snapshot.data!.docs.map((document) {
              return GestureDetector(
                onTap: () {
                  updateproject(
                      document.id, document['pname'], document['proabo']);
                },
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Text(
                            '${document['pname']}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          '${document['proabo']}',
                          style: TextStyle(
                              fontSize: 12, color: Colors.grey.shade600),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${document['Date']}',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey.shade600),
                            ),
                            GestureDetector(
                                onTap: () {
                                  Weblink().weblaunch(document['link']);
                                },
                                child: const Icon(
                                  Icons.share,
                                  color: Colors.grey,
                                )),
                            GestureDetector(
                                onTap: () {
                                  updateprojlink(document.id);
                                },
                                child: const Icon(
                                  Icons.link,
                                  color: Colors.grey,
                                )),
                            GestureDetector(
                                onTap: () {
                                  deleteproject(document.id);
                                },
                                child: const Icon(
                                  Icons.delete,
                                  color: Colors.grey,
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          );
        });
  }

  void alertname(String title) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(title),
        content: TextFormField(
          maxLines: 1,
          keyboardType: TextInputType.text,
          controller: name,
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              usersCollection.doc(user!.uid).update({
                'name': name.text,
              }).whenComplete(() => Navigator.of(ctx).pop());
            },
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(14),
              child: const Text("Submit"),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(14),
              child: const Text("Back"),
            ),
          ),
        ],
      ),
    );
  }

  void alertposition(String title) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(title),
        content: TextFormField(
          maxLines: 1,
          keyboardType: TextInputType.text,
          controller: position,
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              usersCollection.doc(user!.uid).update({
                'position': position.text,
              }).whenComplete(() => Navigator.of(ctx).pop());
            },
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(14),
              child: const Text("Submit"),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(14),
              child: const Text("Back"),
            ),
          ),
        ],
      ),
    );
  }

  void alertqualification(String title) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(title),
        content: TextFormField(
          maxLines: 1,
          keyboardType: TextInputType.text,
          controller: qualification,
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              usersCollection.doc(user!.uid).update({
                'qualification': qualification.text,
              }).whenComplete(() => Navigator.of(ctx).pop());
            },
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(14),
              child: const Text("Submit"),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(14),
              child: const Text("Back"),
            ),
          ),
        ],
      ),
    );
  }

  void alertexperience(String title) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(title),
        content: TextFormField(
          maxLines: 1,
          keyboardType: TextInputType.number,
          controller: experience,
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              usersCollection.doc(user!.uid).update({
                'experience': experience.text,
              }).whenComplete(() => Navigator.of(ctx).pop());
            },
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(14),
              child: const Text("Submit"),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(14),
              child: const Text("Back"),
            ),
          ),
        ],
      ),
    );
  }

  void alertemail(String title) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(title),
        content: TextFormField(
          maxLines: 1,
          keyboardType: TextInputType.emailAddress,
          controller: email,
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              usersCollection.doc(user!.uid).update({
                'email': email.text,
              }).whenComplete(() => Navigator.of(ctx).pop());
            },
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(14),
              child: const Text("Submit"),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(14),
              child: const Text("Back"),
            ),
          ),
        ],
      ),
    );
  }

  void alertabout(String title, String data) {
    about.text = data;
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(title),
        content: TextFormField(
          maxLength: 300,
          maxLines: 3,
          keyboardType: TextInputType.text,
          // style: TextStyle(fontSize: 10),
          controller: about,
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              usersCollection.doc(user!.uid).update({
                'about': about.text,
              }).whenComplete(() => Navigator.of(ctx).pop());
            },
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(14),
              child: const Text("Submit"),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(14),
              child: const Text("Back"),
            ),
          ),
        ],
      ),
    );
  }

  void alertimage() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Image'),
        content: showimage(),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              updateimage();
            },
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(14),
              child: const Text("Submit"),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(14),
              child: const Text("Back"),
            ),
          ),
        ],
      ),
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
          color: Colors.grey.withOpacity(0.2),
          // borderRadius: BorderRadius.circular(100)
        ),
        height: 120.0,
        width: 120.0,
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
    );
  }

  //choose image
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
  void updateimage() async {
    try {
      final metaData = SettableMetadata();
      final storageRef = FirebaseStorage.instance.ref();
      Reference ref = storageRef.child(
          'uiet/${user!.uid}/profileimage/${DateTime.now().millisecond}');
      final uploadTask = await ref.putFile(File(file!.path), metaData);
      FirebaseFirestore.instance
          .collection('uietdep')
          .doc(user!.uid)
          .update({'img': await uploadTask.ref.getDownloadURL()}).whenComplete(
              () => Navigator.pop(context));
      // uploadUserData(await uploadTask.ref.getDownloadURL());
    } catch (e) {
      print(e);
    }
  }

  void alert(dynamic postid, String imgurl) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Delete"),
        content: const Text("Want to delete?"),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              deleteData(postid, imgurl);
              Navigator.of(ctx).pop();
            },
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(14),
              child: const Text("Yes"),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(14),
              child: const Text("No"),
            ),
          ),
        ],
      ),
    );
  }

  //deleting post
  deleteData(String id, String url) async {
    try {
      final storageReference = FirebaseStorage.instance.refFromURL(url);
      print(storageReference);
      await usersCollection.doc(id).delete().whenComplete(() {
        storageReference.delete();
        Navigator.pushAndRemoveUntil(
            context,
            PageRouteBuilder(
              pageBuilder: (context, a, b) =>
              const Homepage(),
            ),
                (route) => false);
        showSnackBar(Colors.green, "deleted");

      });
    } catch (e) {
      print(e);
    }
  }

  void addproject() {
    pname.clear();
    aboproj.clear();
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        content: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Project name'),
                keyboardType: TextInputType.text,
                controller: pname,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter project name';
                  }
                  return null;
                },
              ),
              TextFormField(
                maxLength: 300,
                maxLines: 3,
                decoration: const InputDecoration(labelText: 'Project details'),
                keyboardType: TextInputType.text,
                controller: aboproj,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter project details';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                usersCollection
                    .doc(user!.uid)
                    .collection('researchProject')
                    .add({
                  'pname': pname.text,
                  'proabo': aboproj.text,
                  'Date': date
                }).whenComplete(() => Navigator.of(ctx).pop());
              } else {
                showSnackBar(Colors.red, "fill the from");
              }
            },
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(14),
              child: const Text("Submit"),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(14),
              child: const Text("Back"),
            ),
          ),
        ],
      ),
    );
  }

  void updateproject(String id, String name, String about) {
    pname.text = name;
    aboproj.text = about;
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        content: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Project name'),
                keyboardType: TextInputType.text,
                controller: pname,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter project name';
                  }
                  return null;
                },
              ),
              TextFormField(
                maxLength: 300,
                maxLines: 3,
                decoration: const InputDecoration(labelText: 'Project details'),
                keyboardType: TextInputType.text,
                controller: aboproj,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter project details';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                usersCollection
                    .doc(user!.uid)
                    .collection('researchProject')
                    .doc(id)
                    .update({
                  'pname': pname.text,
                  'proabo': aboproj.text,
                  'Date': date
                }).whenComplete(() => Navigator.of(ctx).pop());
              } else {
                showSnackBar(Colors.red, "fill the from");
              }
            },
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(14),
              child: const Text("Submit"),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(14),
              child: const Text("Back"),
            ),
          ),
        ],
      ),
    );
  }

  void updateprojlink(String id) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Project Link'),
        content: TextFormField(
          // maxLength: 300,
          // maxLines: 2,
          keyboardType: TextInputType.text,
          controller: experience,
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              usersCollection
                  .doc(user!.uid)
                  .collection('researchProject')
                  .doc(id)
                  .update({
                'link': experience.text,
              }).whenComplete(
                      () => {experience.clear(), Navigator.of(ctx).pop()});
            },
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(14),
              child: const Text("Submit"),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(14),
              child: const Text("Back"),
            ),
          ),
        ],
      ),
    );
  }

  void deleteproject(dynamic postid) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Delete"),
        content: const Text("Want to delete?"),
        actions: <Widget>[
          TextButton(
            onPressed: () async {
              try {
                await usersCollection
                    .doc(user!.uid)
                    .collection('researchProject')
                    .doc(postid)
                    .delete()
                    .whenComplete(() {
                  showSnackBar(Colors.green, "deleted");
                });
              } catch (e) {
                print(e);
              }
              Navigator.of(ctx).pop();
            },
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(14),
              child: const Text("Yes"),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(14),
              child: const Text("No"),
            ),
          ),
        ],
      ),
    );
  }

  void showSnackBar(dynamic color, String text) {
    var snackBar = SnackBar(
        backgroundColor: color,
        duration: const Duration(seconds: 1),
        content: Text(text));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
