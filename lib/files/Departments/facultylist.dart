import 'package:flutter/material.dart';
import 'facuiltyProfile.dart';

// ignore: must_be_immutable
class FacuiltyList extends StatefulWidget {
  dynamic departmentname;
  FacuiltyList({super.key, required this.departmentname});

  @override
  State<FacuiltyList> createState() => _FacuiltyListState();
}

class _FacuiltyListState extends State<FacuiltyList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black.withOpacity(0.3),
        elevation: 10,
        shadowColor: Colors.blue.withOpacity(0.4),
        title: Text(
          widget.departmentname,
          style: const TextStyle(fontWeight: FontWeight.w800),
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return imageview();
            }),
      ),
    );
  }

  Widget imageview() {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const FacuiltyProfile(),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: ListTile(
            leading: Image.asset(
              'img/person.jpg',
              fit: BoxFit.cover,
            ),
            title: detail(),
            trailing: const Icon(Icons.account_circle_outlined),
          ),
        ),
      ),
    );
  }

  Widget detail() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Faculty name",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              )),
          Padding(
            padding: EdgeInsets.only(top: 2.0, bottom: 2),
            child: Align(alignment: Alignment.topLeft, child: Text("Post")),
          ),
          Align(alignment: Alignment.topLeft, child: Text("Department name")),
        ],
      ),
    );
  }
}