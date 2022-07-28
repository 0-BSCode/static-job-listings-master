import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:static_job_listings_master/providers/filtersProvider.dart';
import 'package:static_job_listings_master/providers/rootSizeProvider.dart';
import 'package:static_job_listings_master/styles.dart';

class Filter extends StatelessWidget {
  final String filter;
  const Filter({Key? key, required this.filter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double rootSize = Provider.of<RootSizeProvider>(context).rootSize;
    return Container(
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(rootSize * 3 / 15),
                bottomLeft: Radius.circular(rootSize * 3 / 15),
              ),
              color: COLOR_LIGHT_GRAY_CYAN_BACKGROUND.toColor(),
            ),
            padding: EdgeInsets.all(rootSize * 10 / 15),
            child: Text(
              filter,
              style: TextStyle(
                color: COLOR_DARK_CYAN.toColor(),
                fontWeight: FontWeight.w700,
                fontSize: rootSize * 13.5 / 15,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: COLOR_DARK_CYAN.toColor(),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(rootSize * 3 / 15),
                bottomRight: Radius.circular(rootSize * 3 / 15),
              ),
            ),
            child: TextButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  EdgeInsets.all(0),
                ),
                backgroundColor: MaterialStateColor.resolveWith(
                  (states) => COLOR_DARK_CYAN.toColor(),
                ),
              ),
              onPressed: () {
                Provider.of<FiltersProvider>(context, listen: false)
                    .deleteFilter(filter);
              },
              child: Text(
                'X',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
