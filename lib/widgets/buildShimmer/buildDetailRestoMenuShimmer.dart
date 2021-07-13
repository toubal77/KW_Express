import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';

class BuildDetailRestoMenuShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 2,
            offset: Offset(0, 2),
          ),
        ],
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Shimmer.fromColors(
            baseColor: Colors.white,
            highlightColor: Colors.red,
            child: Container(
              height: 20,
              width: 200,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Shimmer.fromColors(
            baseColor: Colors.white,
            highlightColor: Colors.red,
            child: Container(
              height: 30,
              width: 300,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Shimmer.fromColors(
            baseColor: Colors.white,
            highlightColor: Colors.red,
            child: Container(
              height: 20,
              width: 100,
            ),
          ),
        ],
      ),
    );
  }
}
