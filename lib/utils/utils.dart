import 'package:flutter/material.dart';
import 'package:qr_reader/models/scan_model.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchInBrowser(BuildContext context, ScanModel scan) async {
  if (scan.tipo == 'http') {
    final http = scan.valor.split(RegExp(r"^https?:\/\/"));
    Uri url = Uri(scheme: 'https', host: http[1], path: '/');
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  } else {
    //print('geo!!!!');
    Navigator.pushNamed(context, 'mapa', arguments: scan);
  }
}
