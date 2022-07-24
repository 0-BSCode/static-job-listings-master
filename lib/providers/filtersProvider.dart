import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class FiltersProvider with ChangeNotifier, DiagnosticableTreeMixin {
  List<String> _filters = [];

  List<String> get filters => _filters;

  void addFilter(String filter) {
    _filters.add(filter);
    notifyListeners();
  }

  void deleteFilter(String filter) {
    _filters.where((element) => element != filter).toList();
    notifyListeners();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ObjectFlagProperty("Filters", _filters));
  }
}
