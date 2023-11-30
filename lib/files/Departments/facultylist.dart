import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'facuiltyProfile.dart';

// ignore: must_be_immutable
class FacuiltyList extends StatefulWidget {
  dynamic departmentname;
  dynamic bt;
  FacuiltyList({super.key, required this.bt, required this.departmentname});

  @override
  State<FacuiltyList> createState() => _FacuiltyListState();
}

class _FacuiltyListState extends State<FacuiltyList> {
  late DocumentSnapshot? _lastDocument = null;
  List<Map<String, dynamic>> list = [];
  bool _isLoadingData = false;
  bool _isMoreData = true;
  int pagelimit = 100;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    paginationData();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        paginationData();
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white.withOpacity(0.2),
        elevation: 10,
        // shadowColor: Colors.blue.withOpacity(0.4),
        title: Text(
          widget.departmentname,
          style: const TextStyle(fontWeight: FontWeight.w800),
          overflow: TextOverflow.fade,
        ),
      ),
      body: list.isEmpty
          ? Center(
              child: SizedBox(
                height: 330,
                width: 330,
                child: Lottie.asset('img/lottie/helping.json'),
              ),
            )
          : Column(children: [
              Expanded(
                child: ListView.builder(
                    controller: _scrollController,
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      // return Text('${list[index]['name']}');
                      return imageview(list[index]);
                    }),
              ),
            ]),
    );
  }

  Widget imageview(dynamic data) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => FacuiltyProfile(data: data),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: ListTile(
            leading: Image.network(
              data['img'],
              fit: BoxFit.cover,
            ),
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "${data['name']}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top: 2.0, bottom: 2),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Text("${data['position']}")),
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text('${data['email']}')),
                ],
              ),
            ),
            trailing: Icon(
              Icons.verified_rounded,
              color: data['block'] == false ? Colors.green : Colors.red,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> paginationData() async {
    if (_isMoreData) {
      setState(() {
        _isLoadingData = true;
      });
      final collectionReference =
          FirebaseFirestore.instance.collection('uietdep');
      late QuerySnapshot<Map<String, dynamic>> querySnapshot;

      if (_lastDocument == null) {
        querySnapshot = await collectionReference
            .where('department', isEqualTo: widget.bt)
            .limit(pagelimit)
            .get();
      } else {
        querySnapshot = await collectionReference
            .where('department', isEqualTo: widget.bt)
            .limit(pagelimit)
            .startAfterDocument(_lastDocument!)
            .get();
      }
      _lastDocument = querySnapshot.docs.last;
      list.addAll(querySnapshot.docs.map((e) => e.data()));
      _isLoadingData = false;
      // print(list.length);
      setState(() {});
      //   if (querySnapshot.docs.length < 5) {
      //     _isMoreData = false;
      //   }
      // } else {
      //   setState(() {
      //     _isLoadingData = false;
      //   });
      //   // print("No More Data");
    }
  }
}
