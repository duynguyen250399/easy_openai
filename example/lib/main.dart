import 'package:easy_openai/easy_openai.dart';
import 'package:example/app.dart';
import 'package:flutter/material.dart';

final openAI = OpenAI(
  secretApiKey: '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',
  organizationId: 'org-fhnNbDV5Pfk8N5DC1SlLVe9K',
);

void main() {
  runApp(const ExampleApp());
}
