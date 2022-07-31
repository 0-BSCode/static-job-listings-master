import 'package:flutter/material.dart';
import 'package:static_job_listings_master/providers/rootSizeProvider.dart';
import 'package:provider/provider.dart';

const Map<String, double> deviceWidths = {
  'xxs': 480,
  'xs': 575,
  'sm': 767,
  'md': 991,
  'lg': 1119,
  'xl': 1399
};

void determineRootSize(BuildContext context) {
  final RootSizeProvider rootSizeProvider =
      Provider.of<RootSizeProvider>(context);
  final deviceWidth = MediaQuery.of(context).size.width;

  if (deviceWidth < deviceWidths['xxs']!) {
    rootSizeProvider.setRootSize(15);
  } else if (deviceWidth < deviceWidths['xs']!) {
    rootSizeProvider.setRootSize(16.65);
  } else if (deviceWidth < deviceWidths['sm']!) {
    rootSizeProvider.setRootSize(19.9);
  } else if (deviceWidth < deviceWidths['md']!) {
    rootSizeProvider.setRootSize(26.6);
  } else if (deviceWidth < deviceWidths['lg']!) {
    rootSizeProvider.setRootSize(11);
  } else if (deviceWidth < deviceWidths['xl']!) {
    rootSizeProvider.setRootSize(14);
  } else {
    rootSizeProvider.setRootSize(13.5);
  }
}
