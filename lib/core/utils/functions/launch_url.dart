import 'package:bookly_app/core/utils/functions/custom_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchCustomUrl(context, String? url) async {
  if (url!=null) {
  Uri uri = Uri.parse(url); //bookModel.volumeInfo.previewLink!
  if (!await launchUrl(uri)) {
    await launchUrl(uri);
  } else {
    customSnackbar(context, 'Cannot launch $url');
  }
}
}


//'Cannot launch $url'