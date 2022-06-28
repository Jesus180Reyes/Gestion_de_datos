// ignore_for_file: deprecated_member_use

import 'package:url_launcher/url_launcher.dart';

Future urlLauncher(String url) async {
  if (await canLaunch(url)) {
    await launch(
      url,
      forceSafariVC: false,
    );
  }
}
