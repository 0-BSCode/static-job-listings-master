import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<List<dynamic>> readJSONFile() async {
  final String response = await rootBundle.loadString("assets/data/data.json");
  final data = await jsonDecode(response);
  return data;
}
