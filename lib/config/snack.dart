import 'package:flutter/material.dart';

showSnack(context, text) {
  var snackBar = SnackBar(content: Text(text));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
