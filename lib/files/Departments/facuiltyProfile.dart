import 'package:flutter/material.dart';
import '../../services/Copyfunction.dart';

class FacuiltyProfile extends StatefulWidget {
  const FacuiltyProfile({super.key});

  @override
  State<FacuiltyProfile> createState() => _FacuiltyProfileState();
}

class _FacuiltyProfileState extends State<FacuiltyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 8.0, top: 5, bottom: 15, right: 5),
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
                          onTap: () {}, child: const Icon(Icons.share)),
                    ),
                  ),
                ),
                Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 120.0,
                        width: 110.0,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('img/dep/cse.jpg'),
                            fit: BoxFit.fill,
                          ),
                          shape: BoxShape.rectangle,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0, top: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Facuilty namejh,ghlfk,ajgbkfj',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                              overflow: TextOverflow.visible,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Facuilty Post',
                              style: TextStyle(
                                  // fontSize: 20,
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 18,
                            ),
                            Text(
                              'Facuilty Qualification',
                              style: TextStyle(
                                  // fontSize: 25,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              'Year of experiance',
                              style: TextStyle(
                                  // fontSize: 25,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.email),
                    title: const Text('rohit175041@gmail.com'),
                    onTap: () {
                      Copyfunction().copyToClipboard('rohit175041@gmail.com');
                    },
                  ),
                ),
                title('About'),
                const Padding(
                  padding: EdgeInsets.only(right: 5.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'I am a B.E CSE Student at UIET, Panjab University, Chandigarh. My expertise includes Flutter application development and Software development.'
                      ' I have successfully completed my Summer Internship as an app(Android + desktop) developer.',
                      style: TextStyle(fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                // const Divider(),
                title('Research Project'),
                Expanded(child: projectlist())
              ],
            ),
          ),
        ),
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
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: 50,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      'Project name',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'About Project',
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Date',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade600),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
