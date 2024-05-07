import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(content),
  ));
}

String getNameFromEmail(String email) {
//  hung@gmail.com
//List = [hung, @gmail.com]
  return email.split('@')[0];
}
