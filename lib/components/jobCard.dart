import 'package:flutter/material.dart';

class JobCard extends StatelessWidget {
  final Map jobInfo;
  const JobCard({Key? key, required this.jobInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(jobInfo["company"]),
    );
  }
}
