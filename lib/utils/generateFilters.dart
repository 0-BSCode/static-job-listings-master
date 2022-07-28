import 'package:flutter/material.dart';
import 'package:static_job_listings_master/components/Filter.dart';

List<Widget> generateFilters(list) {
  return list.map<Widget>((element) => Filter(filter: element)).toList();
}
