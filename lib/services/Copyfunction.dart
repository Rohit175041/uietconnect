import 'package:flutter/services.dart';

class Copyfunction{
  // This function is triggered when the copy icon is pressed
  Future<void> copyToClipboard(String data) async {
    await Clipboard.setData(ClipboardData(text: data));

    // if (!mounted) return;
    // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    //   content: Text('Link  Copied'),
    // )
    // );
  }
}