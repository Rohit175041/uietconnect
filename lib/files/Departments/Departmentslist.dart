import 'package:flutter/material.dart';
import 'facultylist.dart';

class DepartmentsList extends StatefulWidget {
  const DepartmentsList({super.key});

  @override
  State<DepartmentsList> createState() => _DepartmentsListState();
}

class _DepartmentsListState extends State<DepartmentsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                  child: ListTile(
                      leading: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(Icons.arrow_back)),
                      title: const Center(
                        child: Text(
                          "Departments",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ))),
              const SizedBox(height: 5),
              imageview('CSE','img/dep/cse.jpg', 'Computer Science and Engineering',
                  'CSE is an academic program which comprises approaches of computer science and computer engineering.'),
              imageview('IT','img/dep/it.jpg', 'Information Technology',
                  'IT is a set of related fields that encompass computer systems, software, programming languages and information processing.'),
              imageview('ECE',
                  'img/dep/ece.jpg',
                  'Electronics and Communication Engineering',
                  'ECE involves developing and testing electronic circuits and communication devices like transmitters, receivers and integrated circuits.'),
              imageview('EEE',
                  'img/dep/eee.jpg',
                  'Electrical and Electronics Engineering',
                  'EEE deals with the technological aspects of electricity, especially the design and application of circuitry and electronic equipment.'),
              imageview('ME','img/dep/me.jpg', 'Mechanical Engineering',
                  'ME combines engineering physics and mathematics principles with materials science, to design, manufacture, and mechanical systems.'),
              imageview('BT','img/dep/bt.jpg', 'Biotechnology',
                  'It involves the integration of natural sciences and engineering sciences in order to achieve the application of organisms, cells and molecules.'),
            ],
          ),
        ),
      ),
    );
  }

  Widget imageview(String bt,String img, String departmentname, String description) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) =>
                  FacuiltyList(bt:bt,departmentname: departmentname,),
            ),
          );
        },
        child: Card(
          child: ListTile(
              leading: Image.asset(
                img,
                height: MediaQuery.sizeOf(context).height / 4,
                width: MediaQuery.sizeOf(context).width / 5,
              ),
              title: detail(
                  departmentname, description)),
        ),
      ),
    );
  }

  Widget detail(String departmentname, String description) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              departmentname,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 2.0, bottom: 2),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  description,
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                )),
          ),
        ],
      ),
    );
  }
}
