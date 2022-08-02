import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';
import 'package:static_job_listings_master/components/cardContent.dart';
import 'package:static_job_listings_master/components/cardTags.dart';
import 'package:static_job_listings_master/components/jobDescription.dart';
import 'package:static_job_listings_master/components/jobDetail.dart';
import 'package:static_job_listings_master/components/jobTag.dart';
import 'package:static_job_listings_master/providers/activeJobProvider.dart';
import 'package:static_job_listings_master/providers/rootSizeProvider.dart';
import 'package:static_job_listings_master/styles.dart';
import 'package:static_job_listings_master/utils/addSpacing.dart';
import 'package:static_job_listings_master/utils/determineRootSize.dart';
import 'package:static_job_listings_master/utils/generateDescriptions.dart';
import 'package:static_job_listings_master/utils/parseImagePath.dart';

class JobCard extends StatelessWidget {
  final Map jobInfo;
  const JobCard({Key? key, required this.jobInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double rootSize = Provider.of<RootSizeProvider>(context).rootSize;
    final int activeJobId = Provider.of<ActiveJobProvider>(context).id;
    final double deviceWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.fromLTRB(
        0,
        0,
        0,
        deviceWidth < deviceWidths['md']! ? rootSize * 4 : rootSize * 2,
      ),
      child: Container(
        height:
            deviceWidth < deviceWidths['md']! ? rootSize * 17.5 : rootSize * 11,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(rootSize * 5 / 15),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, rootSize * 7 / 15),
              blurRadius: rootSize * 10 / 15,
              spreadRadius: rootSize * 2 / 15,
              color: COLOR_DARK_CYAN.toColor().withOpacity(0.2),
            ),
          ],
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: deviceWidth < deviceWidths['md']!
                      ? -rootSize * 1.5
                      : rootSize * 2.5,
                  left: deviceWidth < deviceWidths['md']!
                      ? rootSize * 1.5
                      : rootSize * 3,
                  child: Image(
                    image: AssetImage(
                      parseImagePath(jobInfo['logo']),
                    ),
                    width: deviceWidth < deviceWidths['md']!
                        ? rootSize * 3.5
                        : rootSize * 6,
                  ),
                ),
                Wrap(
                  direction: Axis.horizontal,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  children: [
                    if (activeJobId == jobInfo["id"])
                      Container(
                        width: rootSize * 5 / 15,
                        height: constraints.maxHeight,
                        decoration: BoxDecoration(
                          color: COLOR_DARK_CYAN.toColor(),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(rootSize * 5 / 15),
                            bottomLeft: Radius.circular(rootSize * 5 / 15),
                          ),
                        ),
                      ),
                    Container(
                      padding: deviceWidth < deviceWidths['md']!
                          ? EdgeInsets.fromLTRB(
                              rootSize * 1.5, rootSize * 3, 0, 0)
                          : EdgeInsets.fromLTRB(
                              rootSize * 11, rootSize * 2, rootSize * 3, 0),
                      width: constraints.maxWidth - rootSize,
                      child: deviceWidth < deviceWidths['md']!
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CardContent(jobInfo: jobInfo),
                                addVerticalSpacing(rootSize * 13 / 15),
                                Container(
                                  height: rootSize * 2 / 15,
                                  width:
                                      constraints.maxWidth - (rootSize * 3.5),
                                  color:
                                      COLOR_LIGHT_GRAY_CYAN_TABLETS.toColor(),
                                ),
                                addVerticalSpacing(rootSize * 13 / 15),
                                CardTags(jobInfo: jobInfo),
                              ],
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CardContent(jobInfo: jobInfo),
                                addVerticalSpacing(rootSize * 13 / 15),
                                CardTags(jobInfo: jobInfo),
                              ],
                            ),
                    ),
                  ],
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
