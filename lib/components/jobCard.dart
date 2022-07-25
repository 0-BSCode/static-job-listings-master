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
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(rootSize * 5 / 15),
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: rootSize * 5 / 15,
                      decoration: BoxDecoration(
                        color: COLOR_DARK_CYAN.toColor(),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(rootSize * 5 / 15),
                          bottomLeft: Radius.circular(rootSize * 5 / 15),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: rootSize * 1.5, vertical: rootSize * 3),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                jobInfo['company'],
                              ),
                              if (jobInfo['new'])
                                Container(
                                  child: Text(
                                    "NEW!",
                                  ),
                                ),
                              if (jobInfo['featured'])
                                Container(
                                  child: Text(
                                    'FEATURED',
                                  ),
                                ),
                            ],
                          ),
                          Text(
                            jobInfo['position'],
                          ),
                          Row(
                            children: [
                              Text(jobInfo['postedAt']),
                              Text(
                                ' • ',
                              ),
                              Text(
                                jobInfo['contract'],
                              ),
                              Text(
                                ' • ',
                              ),
                              Text(
                                jobInfo['location'],
                              ),
                            ],
                          ),
                          Container(
                            height: rootSize * 3 / 15,
                            width: constraints.maxWidth - (rootSize * 4),
                            color: COLOR_LIGHT_GRAY_CYAN_TABLETS.toColor(),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: jobInfo["languages"].length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      child: Text(jobInfo["languages"][index]),
                                    );
                                  },
                                ),
                                ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: jobInfo["tools"].length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      child: Text(jobInfo["tools"][index]),
                                    );
                                  },
                                ),
                              ],
                            ),
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
