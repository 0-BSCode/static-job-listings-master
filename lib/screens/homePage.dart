import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:static_job_listings_master/providers/rootSizeProvider.dart';
import 'package:static_job_listings_master/styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double rootSize = Provider.of<RootSizeProvider>(context).rootSize;
    final double deviceWidth = MediaQuery.of(context).size.width;
    debugPrint("${deviceWidth}");
    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              width: constraints.maxWidth,
              height: constraints.maxHeight,
              color: COLOR_LIGHT_GRAY_CYAN_BACKGROUND.toColor(),
              child: Column(
                children: [
                  Container(
                    color: COLOR_DARK_CYAN.toColor(),
                    child: SvgPicture.asset(
                      "assets/images/bg-header-mobile.svg",
                      semanticsLabel: "Background header mobile",
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        rootSize * 2, rootSize * 2, rootSize * 2, 0),
                    child: Text("SUP"),
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
