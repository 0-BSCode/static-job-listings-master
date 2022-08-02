import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:static_job_listings_master/components/jobDescription.dart';
import 'package:static_job_listings_master/providers/rootSizeProvider.dart';
import 'package:static_job_listings_master/utils/generateDescriptions.dart';

class CardTags extends StatelessWidget {
  final Map jobInfo;
  const CardTags({Key? key, required this.jobInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double rootSize = Provider.of<RootSizeProvider>(context).rootSize;
    return Wrap(
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
    );
  }
}
