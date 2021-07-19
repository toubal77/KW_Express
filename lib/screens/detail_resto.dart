import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kw_express/home_widget.dart';
import 'package:kw_express/models/cart.dart';
import 'package:kw_express/models/detailRestaurant.dart';
import 'package:kw_express/models/detailRestoMenu.dart';
import 'package:kw_express/models/restaurant.dart';
import 'package:kw_express/screens/cartScreen.dart';
import 'package:kw_express/services/databases.dart';
import 'package:kw_express/widgets/builFFloatButtonDetailResto.dart';
import 'package:kw_express/widgets/buildDetailRestoMenu.dart';
import 'package:kw_express/widgets/buildShimmer/buildDetailRestoMenuShimmer.dart';
import 'package:kw_express/widgets/buildShimmer/buildTabBarShimmer.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

// ignore: must_be_immutable
class DetailResto extends StatefulWidget {
  Restaurant? resDet;
  DetailResto(this.resDet);

  @override
  _DetailRestoState createState() => _DetailRestoState();
}

class _DetailRestoState extends State<DetailResto> {
  late Color color;
  late TabController tabController;
  @override
  initState() {
    DatabaseMethodes().updateVue(widget.resDet!.id_resto);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Provider.of<Cart>(context, listen: false).itemEmpty == true
                ? Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomeWidget()),
                  )
                : showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Panier sera efface"),
                        content: Text(
                            'si vous sortez de ce restaurant votre panier sera efface'),
                        actions: [
                          TextButton(
                            child: Text(
                              'CANCEL',
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: Text(
                              'OK',
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            onPressed: () {
                              Provider.of<Cart>(context, listen: false).clear();

                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeWidget(),
                                ),
                              );
                            },
                          ),
                        ],
                      );
                    },
                  );
          },
          icon: Icon(
            Icons.backpack,
          ),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 150,
                child: widget.resDet!.img_cover
                            .contains('scontent.forn2-1.fna.fbcdn.net') ||
                        widget.resDet!.img_cover
                            .contains('scontent-mrs2-1.xx.fbcdn.net') ||
                        widget.resDet!.img_cover
                            .contains('scontent-mrs2-2.xx.fbcdn.net') ||
                        widget.resDet!.img_cover
                            .contains('scontent-pmo1-1.xx.fbcdn.net')
                    ? SvgPicture.asset('assets/drawable/resto_profile.svg')
                    : Image.network(
                        widget.resDet!.img_cover.toString(),
                        fit: BoxFit.cover,
                      ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 1,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 13,
                    ),
                    Text(
                      widget.resDet!.service.toString(),
                      style: TextStyle(fontSize: 12),
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    FutureBuilder<List<DetailRestaurant?>?>(
                      future: DatabaseMethodes().fetechdetailResto(
                        widget.resDet!.id_resto,
                      ),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return DefaultTabController(
                            length: snapshot.data!.length,
                            child: TabBar(
                              isScrollable: true,
                              indicatorColor: Colors.red,
                              indicatorWeight: 2.0,
                              tabs: <Widget>[
                                for (int i = 0; i < snapshot.data!.length; i++)
                                  Tab(
                                    child: Container(
                                      child: Text(
                                        snapshot.data![i]!.nom_spec,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          );
                        }
                        return BuildTabBarShimmer();
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: FutureBuilder<List<DetailRestoMenu?>?>(
                  future: DatabaseMethodes()
                      .fetechdetailRestoMenu(widget.resDet!.id_resto, '1'),
                  builder: (context, snapshot) {
                    if (snapshot.hasData)
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return BuildDetailRestoMenu(snapshot.data![index]!);
                        },
                      );
                    return ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Shimmer.fromColors(
                          baseColor: Colors.white,
                          highlightColor: Colors.red,
                          child: BuildDetailRestoMenuShimmer(),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
          Positioned(
            top: 110,
            left: 25,
            child: widget.resDet!.img_profile
                        .contains('scontent.forn2-1.fna.fbcdn.net') ||
                    widget.resDet!.img_profile
                        .contains('scontent-mrs2-1.xx.fbcdn.net') ||
                    widget.resDet!.img_profile
                        .contains('scontent-mrs2-2.xx.fbcdn.net') ||
                    widget.resDet!.img_profile
                        .contains('scontent-pmo1-1.xx.fbcdn.net')
                ? Container(
                    width: 90,
                    height: 90,
                    child:
                        SvgPicture.asset('assets/drawable/resto_profile.svg'),
                  )
                : Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      border: Border.all(color: Colors.white, width: 5.0),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network(
                        widget.resDet!.img_profile.toString(),
                      ),
                    ),
                  ),
          ),
          if (Provider.of<Cart>(context, listen: false).itemEmpty == true)
            Positioned(
              bottom: 20,
              left: 25,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          CartScreen(widget.resDet!.nom_resto),
                    ),
                  );
                },
                child: Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 2,
                        offset: Offset(1, 2),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      'VOIR PANIER',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
      floatingActionButton: BuildFloatButtonDetailResto(widget.resDet!),

      // floatingActionButton: UnicornDialer(
      //   backgroundColor: Color.fromRGBO(255, 255, 255, 0.6),
      //   parentButtonBackground: Colors.redAccent,
      //   orientation: UnicornOrientation.VERTICAL,
      //   parentButton: Icon(IconsApp.floatButton),
      //   childButtons: [
      //     UnicornButton(
      //       currentButton: FloatingActionButton(
      //         heroTag: "Trouve",
      //         backgroundColor: Colors.red,
      //         mini: true,
      //         onPressed: () {},
      //         child: Icon(IconsApp.trouve),
      //       ),
      //     ),
      //     UnicornButton(
      //       currentButton: FloatingActionButton(
      //         heroTag: "Reserver",
      //         backgroundColor: Colors.red,
      //         mini: true,
      //         onPressed: () {},
      //         child: Icon(IconsApp.reserver),
      //       ),
      //     ),
      //     UnicornButton(
      //       currentButton: FloatingActionButton(
      //         heroTag: "Commander",
      //         backgroundColor: Colors.red,
      //         mini: true,
      //         onPressed: () {},
      //         child: Icon(IconsApp.commande),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
