import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class RootSizeProvider with ChangeNotifier, DiagnosticableTreeMixin {
  double _rootSize = 15;

  double get rootSize => _rootSize;

  void setRootSize(double newSize) {
    _rootSize = newSize;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DoubleProperty("Root Size", _rootSize));
  }
}
