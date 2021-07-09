import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kw_express/helper/icons_app.dart';
import 'package:kw_express/models/restaurant.dart';
import 'package:kw_express/screens/detail_resto.dart';

// ignore: must_be_immutable
class CardBuildRestaurant extends StatefulWidget {
  Restaurant? res;
  CardBuildRestaurant(this.res);
  @override
  _CardBuildRestaurantState createState() => _CardBuildRestaurantState();
}

class _CardBuildRestaurantState extends State<CardBuildRestaurant> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return DetailResto(widget.res);
            },
          ),
        );
      },
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(
                top: 7.0, left: 10.0, right: 10.0, bottom: 10.0),
            height: 310,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 3,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: widget.res!.img_cover
                                .contains('scontent.forn2-1.fna.fbcdn.net') ||
                            widget.res!.img_cover
                                .contains('scontent-mrs2-1.xx.fbcdn.net') ||
                            widget.res!.img_cover
                                .contains('scontent-mrs2-2.xx.fbcdn.net') ||
                            widget.res!.img_cover
                                .contains('scontent-pmo1-1.xx.fbcdn.net')
                        ? SvgPicture.asset('assets/drawable/resto_building.svg')
                        : Image.network(
                            '${widget.res!.img_cover.toString()}',
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 30,
            left: 30,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${widget.res!.nom_resto}',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 18.0,
                    ),
                  ),
                  Text(
                    '${widget.res!.adress}',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15.0,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 120,
            left: 30,
            child: widget.res!.img_profile
                        .contains('scontent.forn2-1.fna.fbcdn.net') ||
                    widget.res!.img_profile
                        .contains('scontent-mrs2-1.xx.fbcdn.net') ||
                    widget.res!.img_profile
                        .contains('scontent-mrs2-2.xx.fbcdn.net') ||
                    widget.res!.img_profile
                        .contains('scontent-pmo1-1.xx.fbcdn.net')
                ? Container(
                    width: 85,
                    height: 85,
                    child:
                        SvgPicture.asset('assets/drawable/resto_profile.svg'),
                  )
                : Container(
                    width: 85,
                    height: 85,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 5.0),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network(
                        '${widget.res!.img_profile.toString()}',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
          ),
          Positioned(
            top: 140,
            right: 20,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 3,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  '${widget.res!.dure}',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14.0,
                  ),
                ),
              ),
              height: 40,
              width: 100,
            ),
          ),
          Positioned(
            bottom: 55,
            right: 40,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isFavorite = !isFavorite;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 3,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                height: 55,
                width: 55,
                child: Icon(
                  isFavorite ? IconsApp.isFavorite : IconsApp.notFavorite,
                  color: isFavorite ? Colors.red : Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
