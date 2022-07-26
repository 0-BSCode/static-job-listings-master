import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:static_job_listings_master/providers/rootSizeProvider.dart';

class JobTag extends StatelessWidget {
  final String name;
  final Color bgColor;
  const JobTag({Key? key, required this.name, required this.bgColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double rootSize = Provider.of<RootSizeProvider>(context).rootSize;

    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: rootSize * 7 / 15, vertical: rootSize * 4 / 15),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(rootSize),
      ),
      child: Text(
        name,
        style: TextStyle(
          color: Colors.white,
          fontSize: rootSize * 12 / 15,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
