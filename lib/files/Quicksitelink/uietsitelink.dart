import 'package:url_launcher/url_launcher.dart';

class Weblink {
  List<String> linkname = [
    "DIC",
    // "Result",
    "UIET website",
    "Syllabus",
    "Previous Paper",
    "Placement",
    "Scholarship",
    "Notice",
    "Contact"
  ];
  List<String> link = [
    'https://dicpu.in/',
    // 'https://eakadamik.in/uietchd/',
    'https://uiet.puchd.ac.in',
    'https://uiet.puchd.ac.in/?page_id=3234',
    'https://uiet.puchd.ac.in/?page_id=4119',
    'https://uiet.puchd.ac.in/?page_id=323',
    'https://uiet.puchd.ac.in/?page_id=4229',
    'https://uiet.puchd.ac.in/?page_id=1161',
    'https://uiet.puchd.ac.in/?page_id=273'
  ];
  void weblaunch(String link) async {
    Uri url = Uri.parse(link);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
