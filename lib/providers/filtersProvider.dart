import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:static_job_listings_master/utils/readJSONFile.dart';

class FiltersProvider with ChangeNotifier, DiagnosticableTreeMixin {
  List<String> _filters = [];
  List<dynamic> _jobs = [];
  List<dynamic> _filteredJobs = [];

  List<String> get filters => _filters;
  List<dynamic> get jobs => _jobs;
  List<dynamic> get filteredJobs => _filteredJobs;

  FiltersProvider() {
    initJobs();
  }

  Future<void> initJobs() async {
    readJSONFile().then(
        (data) => {_jobs = data, _filteredJobs = data, notifyListeners()});
  }

  void filterJobs() {
    _filteredJobs = _jobs;

    if (_filters.isNotEmpty) {
      _filters.forEach((filter) {
        print("${filter}");
        _filteredJobs = _filteredJobs
            .where((job) =>
                job['languages'].contains(filter) ||
                job['tools'].contains(filter) ||
                job['role'] == filter ||
                job['level'] == filter)
            .toList();
        print("${_filteredJobs.length}");
      });
    }
  }

  void addFilter(String filter) {
    if (!_filters.contains(filter)) _filters.add(filter);
    filterJobs();
    notifyListeners();
  }

  void deleteFilter(String filter) {
    _filters = _filters.where((element) => element != filter).toList();
    filterJobs();
    notifyListeners();
  }

  void clearFilters() {
    _filters = [];
    filterJobs();
    notifyListeners();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ObjectFlagProperty("Filters", _filters));
  }
}
