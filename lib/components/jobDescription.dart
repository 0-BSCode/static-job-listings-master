import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:static_job_listings_master/providers/rootSizeProvider.dart';
import 'package:static_job_listings_master/styles.dart';

class JobDescription extends StatelessWidget {
  final String description;
  const JobDescription({Key? key, required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double rootSize = Provider.of<RootSizeProvider>(context).rootSize;
    return Container(
      padding: EdgeInsets.all(rootSize * 7 / 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(rootSize * 3 / 15),
        color: COLOR_LIGHT_GRAY_CYAN_BACKGROUND.toColor(),
      ),
      child: Text(
        description,
        style: TextStyle(
          color: COLOR_DARK_CYAN.toColor(),
          fontWeight: FontWeight.w700,
          fontSize: rootSize * 13 / 15,
        ),
      ),
    );
  }
}
