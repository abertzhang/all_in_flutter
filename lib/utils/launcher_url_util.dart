import 'package:url_launcher/url_launcher.dart';

class LauncherUtil {
  static Future<bool> telephone(String tel) async {
    Uri uri = Uri(scheme: 'tel', path: tel);
    if (!await canLaunchUrl(uri)) return false;
    await launchUrl(uri);
    return true;
  }

  static Future<bool> http(String url) async {
    Uri? uri = Uri.tryParse(url);
    if (uri == null) return false;
    if (!await canLaunchUrl(uri)) return false;
    await launchUrl(uri);
    return true;
  }

  static Future<bool> email(String mail, {String? subject, String? content}) async {
    Uri uri = Uri(
      scheme: 'mailto',
      path: mail,
      queryParameters: {'subject': subject ?? '', 'body': content ?? ''},
    );
    if (!await canLaunchUrl(uri)) return false;
    await launchUrl(uri);
    return true;
  }

  static Future<bool> sms(String tel, {String? content}) async {
    Uri uri = Uri(
      scheme: 'sms',
      path: 'tel',
      queryParameters: <String, String>{'body': Uri.encodeComponent(content ?? '')},
    );
    if (!await canLaunchUrl(uri)) return false;
    await launchUrl(uri);
    return true;
  }
}
