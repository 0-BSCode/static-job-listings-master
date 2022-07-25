import 'package:flutter/material.dart';

String parseImagePath(String path) {
  return path.replaceFirst('.', 'assets').replaceFirst('svg', 'png');
}
