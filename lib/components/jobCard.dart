import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';
import 'package:static_job_listings_master/providers/rootSizeProvider.dart';
import 'package:static_job_listings_master/styles.dart';
import 'package:static_job_listings_master/utils/parseImagePath.dart';

class JobCard extends StatelessWidget {
  final Map jobInfo;
  const JobCard({Key? key, required this.jobInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double rootSize = Provider.of<RootSizeProvider>(context).rootSize;
    return Padding(
      padding: EdgeInsets.fromLTRB(0, rootSize * 3, 0, 0),
      child: Container(
        height: rootSize * 12,
        padding: EdgeInsets.symmetric(
            horizontal: rootSize, vertical: rootSize * 1.5),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            left: BorderSide(
              color: COLOR_DARK_CYAN.toColor(),
              width: rootSize * 5 / 15,
              // style: BorderStyle.solid,
            ),
          ),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: -rootSize * 3.5,
              left: rootSize,
              child: Image(
                image: AssetImage(
                  parseImagePath(jobInfo['logo']),
                ),
                width: rootSize * 3.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
