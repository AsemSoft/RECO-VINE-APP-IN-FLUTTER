import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {
  static Future openLink({@required String? url}) => _launchUrl(url!);

  static _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  static Future openEmail({
  required String toEmail,
  required String subject,
  required String body,

})async{
    final  url ='mailto:$toEmail?subject=${Uri.encodeFull(subject)}&body=${body}';
    await launch(url);

  }
}
