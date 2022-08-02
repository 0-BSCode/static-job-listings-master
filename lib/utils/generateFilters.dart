import 'package:flutter/material.dart';
import 'package:static_job_listings_master/components/jobFilter.dart';

List<Widget> generateFilters(list) {
  return list.map<Widget>((element) => JobFilter(filter: element)).toList();
}
