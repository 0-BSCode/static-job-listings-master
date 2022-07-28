import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:static_job_listings_master/components/jobCard.dart';
import 'package:static_job_listings_master/providers/filtersProvider.dart';
import 'package:static_job_listings_master/providers/rootSizeProvider.dart';
import 'package:static_job_listings_master/styles.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:static_job_listings_master/utils/generateFilters.dart';
import 'package:static_job_listings_master/utils/readJSONFile.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> _jobs = [];

  void _filterJobs() {
    setState(() {
      // Logic to filter jobs
    });
  }

  @override
  void initState() {
    super.initState();
    readJSONFile().then(
      (data) => {
        setState(
          () {
            _jobs = data;
          },
        ),
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final double rootSize = Provider.of<RootSizeProvider>(context).rootSize;
    final double deviceWidth = MediaQuery.of(context).size.width;
    final List<String> filters = Provider.of<FiltersProvider>(context).filters;
    debugPrint("${deviceWidth}");
    debugPrint("Filters: ${filters}");
    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              width: constraints.maxWidth,
              height: constraints.maxHeight,
              color: COLOR_LIGHT_GRAY_CYAN_BACKGROUND.toColor(),
              child: Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        color: COLOR_DARK_CYAN.toColor(),
                        child: SvgPicture.asset(
                          "assets/images/bg-header-mobile.svg",
                          semanticsLabel: "Background header mobile",
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          physics: BouncingScrollPhysics(),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(rootSize * 1.5,
                                rootSize * 2, rootSize * 1.5, 0),
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: _jobs.length,
                              itemBuilder: (context, index) {
                                return JobCard(jobInfo: _jobs[index]);
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(rootSize * 5 / 15),
                    ),
                    margin: EdgeInsets.fromLTRB(
                        rootSize * 1.5, rootSize * 8.5, rootSize * 1.5, 0),
                    padding: EdgeInsets.symmetric(
                        horizontal: rootSize, vertical: rootSize * 0.8),
                    child: Row(
                      children: [
                        Expanded(
                          child: Wrap(
                            direction: Axis.horizontal,
                            spacing: rootSize,
                            runSpacing: rootSize,
                            children: [
                              ...generateFilters(filters),
                            ],
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Provider.of<FiltersProvider>(context, listen: false)
                                .clearFilters();
                          },
                          child: Text(
                            'Clear',
                            style: TextStyle(
                              color: COLOR_DARK_GRAY_CYAN.toColor(),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
