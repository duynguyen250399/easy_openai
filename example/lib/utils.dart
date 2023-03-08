import 'package:flutter/material.dart';

void push(BuildContext context, Widget page) {
  Navigator.of(context).push(MaterialPageRoute(builder: (_) => page));
}

void pop(BuildContext context) {
  Navigator.of(context).pop();
}
