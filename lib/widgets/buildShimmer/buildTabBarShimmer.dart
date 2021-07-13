import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BuildTabBarShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: TabBar(
        isScrollable: true,
        indicatorColor: Colors.red,
        indicatorWeight: 2.0,
        tabs: <Widget>[
          for (int i = 0; i < 3; i++)
            Shimmer.fromColors(
              baseColor: Colors.white,
              highlightColor: Colors.red,
              child: Container(
                height: 40,
                width: 100,
                color: Colors.yellow,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
