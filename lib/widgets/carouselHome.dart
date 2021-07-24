import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kw_express/models/restaurant.dart';
import 'package:kw_express/services/databases.dart';

class CarouselHome extends StatefulWidget {
  @override
  _CarouselHomeState createState() => _CarouselHomeState();
}

class _CarouselHomeState extends State<CarouselHome> {
  late Future<List<Restaurant?>?> imageCarousel;
  @override
  void initState() {
    super.initState();
    imageCarousel = DatabaseMethodes().getRestaurant();
  }

  int _current = 0;
  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Restaurant?>?>(
      future: imageCarousel,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  autoPlayAnimationDuration: Duration(seconds: 2),
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  },
                ),
                items: snapshot.data!
                    .map(
                      (item) => Container(
                        child: item!.img_cover.contains(
                                    'scontent.forn2-1.fna.fbcdn.net') ||
                                item.img_cover
                                    .contains('scontent-mrs2-1.xx.fbcdn.net') ||
                                item.img_cover
                                    .contains('scontent-mrs2-2.xx.fbcdn.net') ||
                                item.img_cover
                                    .contains('scontent-pmo1-1.xx.fbcdn.net')
                            ? Container(
                                child: SvgPicture.asset(
                                  'assets/drawable/resto_building.svg',
                                  fit: BoxFit.cover,
                                  width: MediaQuery.of(context).size.width,
                                ),
                              )
                            : Container(
                                child: Image.network(
                                  '${item.img_cover.toString()}',
                                  fit: BoxFit.cover,
                                ),
                              ),
                      ),
                    )
                    .toList(),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: snapshot.data!.asMap().entries.map(
                    (entry) {
                      return GestureDetector(
                        onTap: () => _controller.animateToPage(entry.key),
                        child: Container(
                          width: 4.0,
                          height: 4.0,
                          margin: EdgeInsets.symmetric(
                              vertical: 7.0, horizontal: 2.5),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: (Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : Colors.black)
                                  .withOpacity(
                                      _current == entry.key ? 0.9 : 0.4)),
                        ),
                      );
                    },
                  ).toList(),
                ),
              ),
            ],
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return Container();
        // return Shimmer.fromColors(
        //   baseColor: Colors.white,
        //   highlightColor: Colors.red,
        //   child: Container(
        //     margin: EdgeInsets.only(
        //         top: 7.0, left: 10.0, right: 10.0, bottom: 10.0),
        //     height: 310,
        //     width: MediaQuery.of(context).size.width,
        //     color: Colors.yellow,
        //   ),
        // );
      },
    );
  }
}
