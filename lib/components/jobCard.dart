import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';
import 'package:static_job_listings_master/components/jobDescription.dart';
import 'package:static_job_listings_master/components/jobDetail.dart';
import 'package:static_job_listings_master/components/jobTag.dart';
import 'package:static_job_listings_master/providers/rootSizeProvider.dart';
import 'package:static_job_listings_master/styles.dart';
import 'package:static_job_listings_master/utils/addSpacing.dart';
import 'package:static_job_listings_master/utils/generateDescriptions.dart';
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
        height: rootSize * 17.5,
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
                  top: -rootSize * 1.5,
                  left: rootSize * 1.5,
                  child: Image(
                    image: AssetImage(
                      parseImagePath(jobInfo['logo']),
                    ),
                    width: rootSize * 3.5,
                  ),
                ),
                Wrap(
                  direction: Axis.horizontal,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  children: [
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
                      padding: EdgeInsets.fromLTRB(
                          rootSize * 1.5, rootSize * 3, 0, 0),
                      width: constraints.maxWidth - rootSize,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                jobInfo['company'],
                                style: TextStyle(
                                  color: COLOR_DARK_CYAN.toColor(),
                                  fontSize: rootSize * 14 / 15,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: rootSize * 5 / 150,
                                ),
                              ),
                              addHorizontalSpacing(rootSize),
                              if (jobInfo['new'])
                                JobTag(
                                  name: 'NEW!',
                                  bgColor: COLOR_DARK_CYAN.toColor(),
                                ),
                              addHorizontalSpacing(rootSize * 10 / 15),
                              if (jobInfo['featured'])
                                JobTag(
                                  name: 'FEATURED',
                                  bgColor: COLOR_VERY_DARK_GRAY_CYAN.toColor(),
                                ),
                            ],
                          ),
                          addVerticalSpacing(rootSize * 10 / 15),
                          TextButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              overlayColor: MaterialStateColor.resolveWith(
                                (states) =>
                                    COLOR_LIGHT_GRAY_CYAN_BACKGROUND.toColor(),
                              ),
                              foregroundColor: MaterialStateColor.resolveWith(
                                (states) {
                                  if (states.contains(MaterialState.hovered)) {
                                    return COLOR_DARK_CYAN.toColor();
                                  } else {
                                    return COLOR_VERY_DARK_GRAY_CYAN.toColor();
                                  }
                                },
                              ),
                            ),
                            child: Text(
                              jobInfo['position'],
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: rootSize * 14 / 15,
                              ),
                            ),
                          ),
                          addVerticalSpacing(rootSize * 13 / 15),
                          Row(
                            children: [
                              JobDetail(
                                detail: jobInfo['postedAt'],
                              ),
                              JobDetail(
                                detail: '  •  ',
                              ),
                              JobDetail(
                                detail: jobInfo['contract'],
                              ),
                              JobDetail(
                                detail: '  •  ',
                              ),
                              JobDetail(
                                detail: jobInfo['location'],
                              ),
                            ],
                          ),
                          addVerticalSpacing(rootSize * 13 / 15),
                          Container(
                            height: rootSize * 2 / 15,
                            width: constraints.maxWidth - (rootSize * 3.5),
                            color: COLOR_LIGHT_GRAY_CYAN_TABLETS.toColor(),
                          ),
                          addVerticalSpacing(rootSize * 13 / 15),
                          Wrap(
                            spacing: rootSize,
                            runSpacing: rootSize,
                            children: [
                              JobDescription(
                                description: jobInfo["role"],
                              ),
                              JobDescription(
                                description: jobInfo["level"],
                              ),
                              ...generateDescriptions(jobInfo["languages"]),
                              ...generateDescriptions(jobInfo["tools"]),
                            ],
                          ),
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
