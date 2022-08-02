import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:static_job_listings_master/components/filter.dart';
import 'package:static_job_listings_master/components/jobCard.dart';
import 'package:static_job_listings_master/providers/filtersProvider.dart';
import 'package:static_job_listings_master/providers/rootSizeProvider.dart';
import 'package:static_job_listings_master/styles.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:static_job_listings_master/utils/addSpacing.dart';
import 'package:static_job_listings_master/utils/determineRootSize.dart';
import 'package:static_job_listings_master/utils/generateFilters.dart';
import 'package:static_job_listings_master/utils/readJSONFile.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    determineRootSize(context);
    final double rootSize = Provider.of<RootSizeProvider>(context).rootSize;
    final double deviceWidth = MediaQuery.of(context).size.width;
    final List<String> filters = Provider.of<FiltersProvider>(context).filters;
    final List<dynamic> filteredJobs =
        Provider.of<FiltersProvider>(context).filteredJobs;
    debugPrint("${deviceWidth}");
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
                  Container(
                    color: COLOR_DARK_CYAN.toColor(),
                    child: SvgPicture.asset(
                      deviceWidth < deviceWidths['md']!
                          ? "assets/images/bg-header-mobile.svg"
                          : "assets/images/bg-header-desktop.svg",
                      semanticsLabel: "Background header mobile",
                      width: constraints.maxWidth,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(rootSize * 5 / 15),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, rootSize * 7 / 15),
                              blurRadius: rootSize * 10 / 15,
                              spreadRadius: rootSize * 2 / 15,
                              color: COLOR_DARK_CYAN.toColor().withOpacity(0.2),
                            ),
                          ],
                        ),
                        margin: deviceWidth < deviceWidths['md']!
                            ? EdgeInsets.fromLTRB(
                                rootSize * 1.5, 130, rootSize * 1.5, 0)
                            : EdgeInsets.fromLTRB(
                                rootSize * 1.5, 80, rootSize * 1.5, 0),
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
                                Provider.of<FiltersProvider>(context,
                                        listen: false)
                                    .clearFilters();
                              },
                              style: ButtonStyle(
                                overlayColor: MaterialStateColor.resolveWith(
                                  (states) => COLOR_LIGHT_GRAY_CYAN_BACKGROUND
                                      .toColor(),
                                ),
                                foregroundColor: MaterialStateColor.resolveWith(
                                  (states) {
                                    if (states
                                        .contains(MaterialState.hovered)) {
                                      return COLOR_DARK_CYAN.toColor();
                                    } else {
                                      return COLOR_DARK_GRAY_CYAN.toColor();
                                    }
                                  },
                                ),
                              ),
                              child: Text(
                                'Clear',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: deviceWidth < deviceWidths['md']!
                                      ? rootSize * 13.5 / 15
                                      : rootSize * 14.5 / 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          physics: BouncingScrollPhysics(),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(
                                rootSize * 1.5, rootSize, rootSize * 1.5, 0),
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: filteredJobs.length,
                              itemBuilder: (context, index) {
                                return JobCard(jobInfo: filteredJobs[index]);
                              },
                            ),
                          ),
                        ),
                      ),
                      // addVerticalSpacing(rootSize * 2),
                    ],
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
