import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Push(context, screen) {
  Navigator.push(context, CupertinoPageRoute(builder: (_) => screen));
}

PushUntil(context, screen) {
  Navigator.pushAndRemoveUntil(
      context, MaterialPageRoute(builder: (_) => screen), (route) => false);
}
