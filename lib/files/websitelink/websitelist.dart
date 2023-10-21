import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uietconnect/files/websitelink/uietsitelink.dart';

class Websitelist extends StatefulWidget {
  const Websitelist({super.key});

  @override
  State<Websitelist> createState() => _WebsitelistState();
}

class _WebsitelistState extends State<Websitelist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Site link",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
            itemCount: Weblink().link.length,
            itemBuilder: (BuildContext context, int index) {
              return linklistUI(index);
            }),
      ),
    );
  }

  //link list ui design
  Widget linklistUI(int index) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0, bottom: 4, left: 8, right: 8),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 10),
          child: ListTile(
            title: GestureDetector(
              onTap: () async {
                Weblink().weblaunch(Weblink().link[index]);
              },
              child: Text(
                Weblink().linkname[index],
                style: const TextStyle(color: Colors.blue),
              ),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.link),
              onPressed: () {
                copyToClipboard(index);
              },
            ),
          ),
        ),
      ),
    );
  }

  // This function is triggered when the copy icon is pressed
  Future<void> copyToClipboard(int index) async {
    await Clipboard.setData(ClipboardData(text: Weblink().link[index]));

    if (!mounted) return;
    // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    //   content: Text('Link  Copied'),
    // )
    // );
  }
}
