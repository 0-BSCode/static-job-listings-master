import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class ActiveJobProvider with ChangeNotifier, DiagnosticableTreeMixin {
  int _id = 1;

  int get id => _id;

  void setActiveJobId(int newId) {
    _id = newId;
    notifyListeners();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    // TODO: implement debugFillProperties
    super.debugFillProperties(properties);
    properties.add(IntProperty("Active Job ID", _id));
  }
}
