import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OffreResto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Offres Restaurants',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        elevation: 10.0,
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            height: 300,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade500,
                  blurRadius: 3,
                  offset: Offset(0, 8),
                ),
              ],
            ),
            child: SvgPicture.asset('assets/drawable/resto_offre.svg'),
          ),
          Container(
            margin: EdgeInsets.all(10),
            height: 300,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade500,
                  blurRadius: 3,
                  offset: Offset(0, 8),
                ),
              ],
            ),
            child: SvgPicture.asset('assets/drawable/resto_offre.svg'),
          ),
          Container(
            margin: EdgeInsets.all(10),
            height: 300,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade500,
                  blurRadius: 3,
                  offset: Offset(8, 8),
                ),
              ],
            ),
            child: SvgPicture.asset('assets/drawable/resto_offre.svg'),
          ),
        ],
      ),
    );
  }
}
