import 'package:flutter/material.dart';
import 'package:static_job_listings_master/components/jobDescription.dart';

List<Widget> generateDescriptions(list) {
  return list
      .map<Widget>((element) => JobDescription(description: element))
      .toList();
}
