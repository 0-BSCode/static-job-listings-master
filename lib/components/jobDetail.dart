import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:static_job_listings_master/providers/rootSizeProvider.dart';
import 'package:static_job_listings_master/styles.dart';

class JobDetail extends StatelessWidget {
  final String detail;
  const JobDetail({Key? key, required this.detail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double rootSize = Provider.of<RootSizeProvider>(context).rootSize;
    return Text(
      detail,
      style: TextStyle(
        fontSize: rootSize * 14 / 15,
        color: COLOR_DARK_GRAY_CYAN.toColor(),
        letterSpacing: rootSize * 5 / 150,
      ),
    );
  }
}
