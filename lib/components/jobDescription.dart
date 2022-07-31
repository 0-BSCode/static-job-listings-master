import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:static_job_listings_master/providers/filtersProvider.dart';
import 'package:static_job_listings_master/providers/rootSizeProvider.dart';
import 'package:static_job_listings_master/styles.dart';

class JobDescription extends StatelessWidget {
  final String description;
  const JobDescription({Key? key, required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double rootSize = Provider.of<RootSizeProvider>(context).rootSize;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(rootSize * 3 / 15),
        color: COLOR_LIGHT_GRAY_CYAN_BACKGROUND.toColor(),
      ),
      child: TextButton(
        onPressed: () {
          Provider.of<FiltersProvider>(context, listen: false)
              .addFilter(description);
        },
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            EdgeInsets.all(rootSize * 10 / 15),
          ),
          overlayColor: MaterialStateColor.resolveWith(
            (states) {
              if (states.contains(MaterialState.hovered) ||
                  states.contains(MaterialState.pressed)) {
                return COLOR_DARK_CYAN.toColor();
              } else {
                return Colors.white;
              }
            },
          ),
          foregroundColor: MaterialStateColor.resolveWith(
            (states) {
              if (states.contains(MaterialState.hovered)) {
                return Colors.white;
              } else {
                return COLOR_DARK_CYAN.toColor();
              }
            },
          ),
        ),
        child: Text(
          description,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: rootSize * 13.5 / 15,
          ),
        ),
      ),
    );
  }
}
