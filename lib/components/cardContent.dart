import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:static_job_listings_master/components/jobDetail.dart';
import 'package:static_job_listings_master/components/jobTag.dart';
import 'package:static_job_listings_master/providers/activeJobProvider.dart';
import 'package:static_job_listings_master/providers/rootSizeProvider.dart';
import 'package:static_job_listings_master/styles.dart';
import 'package:static_job_listings_master/utils/addSpacing.dart';

class CardContent extends StatelessWidget {
  final Map jobInfo;
  const CardContent({Key? key, required this.jobInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double rootSize = Provider.of<RootSizeProvider>(context).rootSize;

    return Container(
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
            onPressed: () {
              Provider.of<ActiveJobProvider>(context, listen: false)
                  .setActiveJobId(jobInfo["id"]);
            },
            style: ButtonStyle(
              overlayColor: MaterialStateColor.resolveWith(
                (states) => COLOR_LIGHT_GRAY_CYAN_BACKGROUND.toColor(),
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
        ],
      ),
    );
  }
}
