import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kw_express/helper/icons_app.dart';
import 'package:kw_express/home_widget.dart';
import 'package:kw_express/models/cart.dart';
import 'package:kw_express/models/detailRestaurant.dart';
import 'package:kw_express/models/detailRestoMenu.dart';
import 'package:kw_express/models/restaurant.dart';
import 'package:kw_express/screens/cartScreen.dart';
import 'package:kw_express/services/databases.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:speed_dial_fab/speed_dial_fab.dart';
import 'package:url_launcher/url_launcher.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeWidget()),
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
                                  ),
                                ),
                            ],
                          ),
                        );
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
                          return GestureDetector(
                            onTap: () {
                              Provider.of<Cart>(context, listen: false).addItem(
                                  snapshot.data![index]!.nom,
                                  1,
                                  double.parse(snapshot.data![index]!.prix));
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Ajoute dans le panier'),
                                ),
                              );
                            },
                            child: Container(
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
                                  Text(
                                    snapshot.data![index]!.nom,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 15,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    snapshot.data![index]!.info,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '${snapshot.data![index]!.prix.toString()} DA',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 15,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    return ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Shimmer.fromColors(
                          baseColor: Colors.white60,
                          highlightColor: Colors.red,
                          child: Container(
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
                          ),
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
        ],
      ),
      floatingActionButton: SpeedDialFabWidget(
        secondaryIconsList: [
          IconsApp.trouve,
          IconsApp.reserver,
          IconsApp.commande,
        ],
        secondaryIconsText: [
          "Trouver",
          "Reserver",
          "Commander",
        ],
        secondaryIconsOnPress: [
          // () {
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => CartScreen(),
          //     ),
          //   );
          // },
          () async {
            if (await canLaunch(widget.resDet!.map.toString())) {
              await launch(
                widget.resDet!.map.toString(),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Can\'t open google map'),
                ),
              );
            }
          },
          () => {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Reserver une table:"),
                      content: GestureDetector(
                        onTap: () {
                          launch(
                              'tel:+213${widget.resDet!.num_tel.toString()}');
                        },
                        child: ListTile(
                          leading: Icon(
                            Icons.call,
                            color: Colors.blue,
                          ),
                          title: Text(
                            widget.resDet!.num_tel.toString(),
                          ),
                        ),
                      ),
                    );
                  },
                )
              },
          () => {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Passer votre commande:"),
                      content: Container(
                        height: 120,
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                launch('tel:+213${0542149642}');
                              },
                              child: ListTile(
                                leading: Icon(
                                  Icons.call,
                                  color: Colors.blue,
                                ),
                                title: Text(
                                  '0659185831',
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                launch('tel:+213${0792140427}');
                              },
                              child: ListTile(
                                leading: Icon(
                                  Icons.call,
                                  color: Colors.blue,
                                ),
                                title: Text(
                                  '0792140427',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )
              },
        ],
        primaryIconExpand: IconsApp.floatButton,
        secondaryBackgroundColor: Colors.red,
        secondaryForegroundColor: Colors.white,
        primaryBackgroundColor: Colors.red,
        primaryForegroundColor: Colors.white,
      ),

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
